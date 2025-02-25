import os
import json
import boto3
import feedparser
from botocore.exceptions import ClientError

# SNSクライアントとS3クライアントを作成
sns = boto3.client('sns')
s3 = boto3.client('s3')

# 環境変数からARNとバケット名を取得
SNS_TOPIC_ARN = os.environ.get('SNS_TOPIC_ARN')
S3_BUCKET_NAME = os.environ.get('S3_BUCKET_NAME')
RSS_FEEDS_KEY = "rss_feeds.json"  # S3内RSSデータ

def lambda_handler(event, context):
    try:
        # ① S3から過去のRSSデータ取得
        try:
            s3_response = s3.get_object(Bucket=S3_BUCKET_NAME, Key=RSS_FEEDS_KEY)
            rss_data = json.loads(s3_response['Body'].read().decode('utf-8'))
        except s3.exceptions.NoSuchKey:
            print("rss_feeds.jsonが存在しないため新規作成します。")
            rss_data = []

        updated = False
        aggregated_new_items = []  # 全ての新規アイテムをここに集約

        for rss_item in rss_data:
            rss_url = rss_item.get('url')
            last_checked_guid = rss_item.get('lastCheckedGuid')

            print(f"RSSフィードのURL: {rss_url}")
            print(f"最後にチェックしたGUID: {last_checked_guid}")

            if not rss_url:
                print("URLが未指定。スキップします。")
                continue

            # ② RSS取得
            feed = feedparser.parse(rss_url)
            if not feed.entries:
                print(f"フィードが見つかりません: {rss_url}")
                continue

            # 新規アイテム検出
            new_items = []
            for item in feed.entries:
                if last_checked_guid == item.get('guid'):
                    break
                new_items.append(item)

            if new_items:
                updated = True
                print(f"新規アイテムを検出: {len(new_items)}件")

                # 新規アイテムをまとめ用リストに追加
                for item in new_items:
                    aggregated_new_items.append({
                        "title": item.title,
                        "link": item.link,
                        "pubDate": item.published,
                        "rss_url": rss_url
                    })

                # 最新GUIDを更新
                latest_guid = new_items[0].get('guid')
                rss_item['lastCheckedGuid'] = latest_guid
                print(f"最新GUIDを更新しました: {latest_guid}")

        # ③ SNSにまとめて通知
        if aggregated_new_items:
            message_lines = [f"新規記事まとめ ({len(aggregated_new_items)}件):"]
            for item in aggregated_new_items:
                message_lines.append(f"- {item['title']} ({item['pubDate']})\n  {item['link']}")

            message = "\n".join(message_lines)

            sns.publish(
                TopicArn=SNS_TOPIC_ARN,
                Message=message,
                Subject=f"新着記事まとめ ({len(aggregated_new_items)}件)"
            )
            print(f"SNS通知を送信しました。({len(aggregated_new_items)}件)")

            # ④ S3に更新を保存
            s3.put_object(
                Bucket=S3_BUCKET_NAME,
                Key=RSS_FEEDS_KEY,
                Body=json.dumps(rss_data, ensure_ascii=False).encode('utf-8')
            )
            print("更新データをS3に保存しました。")

            return {
                'statusCode': 200,
                'body': json.dumps("新しいアイテムが検出され、SNSにまとめて通知されました。")
            }

        print("新しいアイテムは見つかりませんでした。")
        return {
            'statusCode': 200,
            'body': json.dumps("新しいアイテムは見つかりませんでした。")
        }

    except ClientError as e:
        print(f"[ERROR] {e}")
        return {
            'statusCode': 500,
            'body': json.dumps("RSSフィード処理中にエラーが発生しました。")
        }

import os
import json
import boto3
import feedparser
import requests
from botocore.exceptions import ClientError

# SNSクライアントを作成
sns = boto3.client('sns')
s3 = boto3.client('s3')

SNS_TOPIC_ARN = os['SNS_TOPIC_ARN']  # ここは実際のSNSトピックARNに変更
S3_BUCKET_NAME = os['S3_BUCKET_NAME']  # 使用するS3バケット名

def lambda_handler(event, context):
    try:
        # Firestore から RSS URL を取得する部分 (仮定: S3 から取得)
        # ここでは S3 を使ってリストを管理する想定です
        s3_response = s3.get_object(Bucket=S3_BUCKET_NAME, Key="rss_feeds.json")
        rss_data = json.loads(s3_response['Body'].read().decode('utf-8'))
        
        for rss_item in rss_data:
            rss_url = rss_item['url']
            last_checked_guid = rss_item.get('lastCheckedGuid', None)

            # RSS フィードを取得
            feed = feedparser.parse(rss_url)
            new_items = []

            # 新しいアイテムを検出
            for item in feed.entries:
                if last_checked_guid and item.guid == last_checked_guid:
                    break
                new_items.append(item)

            if new_items:
                # SNS トピックに通知
                for item in new_items:
                    message = {
                        "title": item.title,
                        "link": item.link,
                        "pubDate": item.published
                    }
                    sns.publish(
                        TopicArn=SNS_TOPIC_ARN,
                        Message=json.dumps(message),
                        Subject=f"New item: {item.title}"
                    )

                # 最新のアイテムの GUID を更新
                latest_item_guid = new_items[0].guid
                # S3に更新した情報を保存（ファイルとして更新する場合）
                rss_item['lastCheckedGuid'] = latest_item_guid
                s3.put_object(Bucket=S3_BUCKET_NAME, Key="rss_feeds.json", Body=json.dumps(rss_data))

                return {
                    'statusCode': 200,
                    'body': json.dumps(f"New items processed, last item: {new_items[0].title}")
                }

            else:
                return {
                    'statusCode': 200,
                    'body': json.dumps(f"No new items for feed: {rss_url}")
                }

    except ClientError as e:
        print(f"Error: {e}")
        return {
            'statusCode': 500,
            'body': json.dumps("Failed to process RSS feeds.")
        }

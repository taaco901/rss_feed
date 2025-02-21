
import json
import boto3
from botocore.exceptions import ClientError

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    
    # イベントからパラメータを取得
    bucket = event['bucket']
    object_key = event['objectKey']    
    id = event.get('id')
    date1 = event.get('date1')
    date2 = event.get('date2')
    
    # SQLクエリを構築
    sql_expression = "SELECT * FROM s3object s WHERE 1=1 A"
    if id:
        sql_expression += f" s.id = '{id}' AND"
    if date1:
        sql_expression += f" s.date >= '{date1}' AND"
    if date2:
        sql_expression += f" s.date <= '{date2}' AND"
    
    # 'AND'で終わる場合、不要な'AND'を削除
    sql_expression = sql_expression.rstrip(' AND')
    
    try:
        # S3 Selectを実行
        response = s3.select_object_content(
            Bucket=bucket,
            Key=object_key,
            ExpressionType='SQL',
            Expression=sql_expression,
            InputSerialization={'JSON': {"Type": "LINES"}},
            OutputSerialization={'JSON': {}},
        )
        
        # 結果を受け取る
        for event_record in response['Payload']:
            if 'Records' in event_record:
                return event_record['Records']['Payload'].decode('utf-8')
    except ClientError as e:
        print(f"Error: {e}")
        return None

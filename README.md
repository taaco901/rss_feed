# Cloud Run RSS to Pub/Sub
## 概要
- ZennのRSSフィードをCloud Runで取得し、Pub/Subに送信
- Cloud Functionsで受信し、ログ出力または別の処理を実行

## 使用技術
- **AWS Lambda**（RSS 取得・処理）
- **Amazon SNS**（メッセージング）
- **Terraform**（インフラ管理）
- **Python / Node.js**（Lambda実装）


https://zenn.dev/waddy/articles/cloud-run-functions-zenn-rss-to-pubsub

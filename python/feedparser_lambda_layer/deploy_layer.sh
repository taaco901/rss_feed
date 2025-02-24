#!/bin/bash

# ----- 設定 -----
LAYER_NAME="feedparser-layer"   # Layerの名前
PYTHON_VERSION="python3.12"     # Pythonランタイム
REGION="ap-northeast-1"         # AWSリージョン
DESCRIPTION="Layer containing feedparser library"  # Layerの説明

# ----- 依存関係のインストール -----
echo "📦 依存関係をインストール中..."
mkdir -p python/lib/${PYTHON_VERSION}/site-packages
pip install -r requirements.txt -t python/lib/${PYTHON_VERSION}/site-packages/

# ----- ZIPファイル作成 -----
echo "📦 Layer用ZIPファイルを作成中..."
zip -r ${LAYER_NAME}.zip python > /dev/null

# # ----- AWS Lambda Layerをデプロイ -----
# echo "🚀 AWS Lambda Layerをデプロイ中..."

# LAYER_ARN=$(aws lambda publish-layer-version \
#   --layer-name ${LAYER_NAME} \
#   --description "${DESCRIPTION}" \
#   --zip-file fileb://${LAYER_NAME}.zip \
#   --compatible-runtimes ${PYTHON_VERSION} \
#   --region ${REGION} \
#   --query LayerVersionArn --output text)

# # ----- 結果表示 -----
# echo "✅ Layerデプロイ完了！"
# echo "Layer ARN: ${LAYER_ARN}"
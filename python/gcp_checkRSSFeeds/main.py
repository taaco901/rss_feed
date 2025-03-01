import feedparser
from google.cloud import firestore
import functions_framework

# Firestoreクライアント初期化
db = firestore.Client()

@functions_framework.http
def fetch_and_store_rss(request):
    rss_url = request.json.get('rss_url')
    if not rss_url:
        return {"message": "rss_url not provided"}, 400

    # RSSフィード取得
    feed = feedparser.parse(rss_url)
    if not feed.entries:
        return {"message": "No RSS entries found"}, 404

    collection_ref = db.collection("rss_feeds")

    for entry in feed.entries:
        doc_ref = collection_ref.document(entry.id if 'id' in entry else entry.link)
        doc_ref.set({
            "title": entry.title,
            "link": entry.link,
            "published": entry.published,
            "summary": entry.summary,
            "rss_url": rss_url
        })

    return {"message": f"Stored {len(feed.entries)} RSS entries"}, 200

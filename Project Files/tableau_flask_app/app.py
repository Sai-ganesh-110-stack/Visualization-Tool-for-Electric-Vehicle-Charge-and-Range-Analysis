import os
import datetime
from flask import Flask, render_template, jsonify, request

app = Flask(__name__)

# Sample metadata for Tableau Visualizations
TABLEAU_METADATA = {
    "title": "Business Intelligence & Data Story 5",
    "workbook_name": "Book1_17844812171770",
    "story_name": "Story5",
    "author": "Data Analytics Team",
    "public_url": "https://public.tableau.com/views/Book1_17844812171770/Story5?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link",
    "embed_src": "https://public.tableau.com/static/images/Bo/Book1_17844812171770/Story5/1.png",
    "host_url": "https://public.tableau.com/",
    "last_updated": datetime.datetime.now().strftime("%B %d, %Y")
}

@app.route("/")
def index():
    """Home Dashboard Page"""
    return render_template(
        "index.html",
        meta=TABLEAU_METADATA,
        page_title="Dashboard & Analytics Portal",
        active_page="home"
    )

@app.route("/story")
def story():
    """Dedicated Tableau Story Explorer Page"""
    return render_template(
        "story.html",
        meta=TABLEAU_METADATA,
        page_title="Interactive Data Story Explorer",
        active_page="story"
    )

@app.route("/api/status")
def api_status():
    """Health check & visualization metadata endpoint"""
    return jsonify({
        "status": "healthy",
        "timestamp": datetime.datetime.utcnow().isoformat() + "Z",
        "app_name": "Tableau Flask Integration Suite",
        "visualization": TABLEAU_METADATA
    })

@app.errorhandler(404)
def page_not_found(e):
    return render_template("base.html", error_code=404, error_message="Page Not Found", active_page="404"), 404

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    print(f" * Starting Tableau Analytics Flask Portal on http://127.0.0.1:{port}")
    app.run(host="0.0.0.0", port=port, debug=True)

# Flask Web Application for Embedded Tableau Dashboards & Stories

A full-featured, responsive, and visually appealing web application built with **Flask** to directly embed and interact with Tableau Dashboards and Stories.

---

## 🌟 Key Features

1. **Flask Web Framework**: Backend routing with dynamic Jinja2 templating for scalable web navigation.
2. **Embedded Tableau Story**: Directly integrates Tableau Public's `Book1_17844812171770 / Story5` with interactive filters and tooltips.
3. **Glassmorphism & Modern UI**: Built with a sleek HSL color design system, glassmorphic cards, and smooth micro-animations.
4. **Theme Switcher**: Instant Dark & Light mode toggle with persistent `localStorage` memory.
5. **Interactive Controls**: Fullscreen mode, live reload button, and direct external link to Tableau Public.
6. **Smart Loading State**: Pulse animation overlay that automatically hides once the Tableau JavaScript API initializes.
7. **REST Health Endpoint**: `/api/status` route returning live JSON metadata about the server and visualization.

---

## 📂 Project Structure

```text
tableau_flask_app/
├── app.py                  # Main Flask application logic & route handlers
├── requirements.txt        # Python dependency list
├── README.md               # Project documentation
├── static/
│   ├── css/
│   │   └── style.css       # Complete CSS design system & themes
│   └── js/
│       └── main.js         # Theme toggle, layout responsiveness, & controls
└── templates/
    ├── base.html           # Master layout template (navbar, header, footer)
    ├── index.html          # Dashboard home page with KPI cards & embedded viz
    └── story.html          # Dedicated story explorer view with sidebar context
```

---

## 🚀 Quick Start Guide

### Prerequisites
- Python 3.8+ installed on your system.

### Installation & Execution

1. Navigate to the project directory:
   ```bash
   cd C:\Users\karan\.gemini\antigravity\scratch\tableau_flask_app
   ```

2. Install the required Python packages:
   ```bash
   pip install -r requirements.txt
   ```

3. Launch the Flask web server:
   ```bash
   python app.py
   ```

4. Open your browser and go to:
   ```text
   http://127.0.0.1:5000
   ```

---

## 💡 Recommended Workspace Setup
If you are working in Google Antigravity, recommend setting `C:\Users\karan\.gemini\antigravity\scratch\tableau_flask_app` as your active workspace for a seamless development experience.

import os
from functools import lru_cache

import requests
from bottle import Bottle, template
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry

app = Bottle()

websites = [
    "www.claranet.com",
    "www.claranet.de",
    "www.claranet.co.uk",
    "www.claranet.fr",
    "www.claranet.nl",
    "www.claranet.es",
    "www.claranet.pt",
    "www.python.org",
]

MAX_RETRIES = os.environ.get("MAX_RETRIES", 3)
DEBUG = os.environ.get("DEBUG", False)


@lru_cache
def measure_website(website):
    session = requests.Session()
    retries = Retry(total=MAX_RETRIES, backoff_factor=0.5, status_forcelist=[500, 502, 503, 504])
    adapter = HTTPAdapter(max_retries=retries)
    session.mount("http://", adapter)

    try:
        response = session.get(f"http://{website}")
        load_time = response.elapsed.total_seconds()
        page_size = len(response.content) / 1024
        return {"website": website, "load_time": load_time, "page_size": page_size}
    except requests.exceptions.RequestException:
        print(f"Error occurred while measuring website: {website}")

    return {"website": website, "load_time": 0, "page_size": 0}


@app.route("/")
def home():
    reports = [measure_website(website) for website in websites]
    sorted_by_time = sorted(reports, key=lambda x: x["load_time"])
    sorted_by_size = sorted(reports, key=lambda x: x["page_size"])
    return template(
        "templates/report.tpl",
        sorted_by_time=sorted_by_time,
        sorted_by_size=sorted_by_size,
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=DEBUG)

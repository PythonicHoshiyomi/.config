#!/usr/bin/env python3
import requests
import json
from datetime import datetime

url = "https://muslimsalat.com/cimanggung.json?key=API_KEY"  # Replace API_KEY

try:
    res = requests.get(url, timeout=5)
    data = res.json()
    today = data['items'][0]
    prayers = [
        ("Subuh", today['fajr']),
        ("Dzuhur", today['dhuhr']),
        ("Ashar", today['asr']),
        ("Maghrib", today['maghrib']),
        ("Isya", today['isha'])
    ]
    # now = datetime.now().strftime("%H:%M")
    # next_prayer = None
    # for name, time in prayers:
    #     if now < time:
    #         next_prayer = f"{name} {time}"
    #         break
    # if not next_prayer:
    #     next_prayer = f"Subuh {prayers[0][1]}"  # Next day's Subuh

    output = {
        # "text": next_prayer,
        "tooltip": "\n".join([f"{name}: {time}" for name, time in prayers])
    }
except Exception as e:
    output = {"text": "Adzan: error", "tooltip": str(e)}

print(json.dumps(output))
#! /usr/bin/python3
#  ref.py
#
#  function
#
#  Copyright (Python) Jie
#  2023-02-11
# 
import requests
import json

api_key = "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"
prompt = "What is Python?"

headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer " + api_key
}

data = {
    "prompt": prompt,
    "max_tokens": 100,
    "temperature": 0.5
}

response = requests.post("https://api.openai.com/v1/engines/davinci/jobs", headers=headers, data=json.dumps(data))

if response.status_code == 200:
    content = response.json()
    reply = content["choices"][0]["text"]
    print(reply)
else:
    print("Request failed with status code: " + str(response.status_code))

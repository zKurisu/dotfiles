#! /usr/bin/python3
#  consistant_gpt.py
#
#  function
#
#  Copyright (Python) Jie
#  2023-02-10
# 

import chatgpt

session = chatgpt.Session()

while True:
  message = input('You: ')
  response = session.send_message(message)
  print('ChatGPT: ', response)

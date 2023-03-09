#! /usr/bin/python3
#  chatgpt.py
#
#  function
#
#  Copyright (Python) Jie
#  2023-02-10
# 

# import openai
# openai.api_key = "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"
#
# def completion(prompt):
#     completions = openai.Completion.create(
#             engine="text-davinci-002",
#             prompt=prompt,
#             max_tokens=1024,
#             n=1,
#             stop=None,
#             temperature=0.5,
#     )
#
#     message = completions.choices[0].text
#     return message
#
# print(completion("Hi"))

import openai

# Define OpenAI API key 
openai.api_key = "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"

# Set up the model and prompt
model_engine = "text-davinci-003"
prompt = "Once upon a time, in a land far, far away, there was a princess who..."

# Generate a response
completion = openai.Completion.create(
    engine=model_engine,
    prompt=prompt,
    max_tokens=1024,
    n=1,
    stop=None,
    temperature=0.5,
)

response = completion.choices[0].text
print(response)

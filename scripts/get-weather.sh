#!/bin/bash

# Respect to Closebox73
# Openweathermap API key
api_key="YOUR_API_KEY"
city_id="YOUR_CITY_ID"
url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}&cnt=5&units=imperial&lang=en"
curl ${url} -s -o ~/.cache/weather.json
exit

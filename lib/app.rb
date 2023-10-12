require 'http'
require 'json'
require 'dotenv'

Dotenv.load

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/engines/text-babbage-001/completions"

headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

data = {
  "prompt" => "fait moi une recette de musculation",
  "max_tokens" => 300,
  "temperature" => 2.3
}

response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip

puts " Alors ?"
puts response_string
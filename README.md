ruby_rest_request_gem
=====================

A ruby gem to send REST request or calls to any API and get the response

Installation:
gem install rest_reques

Usage: 

@req = RestRequest.new

url = 'http://api.example.com/products/'

data = {
      "name"          => "#{$name}",
      "description"   => "#{$description}"
}.to_json


response = @req.send_request("POST", url, data)
response = @req.send_request("PUT", url, data)
response = @req.send_request("GET", url)
response = @req.send_request("DELETE", url)

@req.print_json(response)

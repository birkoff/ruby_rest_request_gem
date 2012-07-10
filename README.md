ruby_rest_request_gem
=====================

> A Ruby gem to send REST Request (POST/PUT/GET/DELETE) to an API, get the response and print it nicely 

### Installation
  Go to the website
  
  > https://rubygems.org/gems/rest_request
  
  Gem Install
  
  > gem install rest_request
  
  Or grab rest_request.rb and use the Class direclty on your own project:

  $ wget https://raw.github.com/birkoff/ruby_rest_request_gem/master/lib/rest_request.rb

### Tutorial

## GET
  >> require "rest_request"
  
  => true
  
  >> url = "http://api.example.com/products/2405669"
  
  => "http://api.example.com/products/2405669"
  
  >> RestRequest.set_header("Referer", "http://example.com")
  
  => "http://example.com"
  
  >> response = RestRequest.send_request("GET", url)
  
  => "{\"status_code\":200,\"message\":\"Success\",\"data\":[{\"type\":\"music\",\"id\":\"2405669\",\"name\":\"product\",\"status\":\"in_setup\"}]}"
  
  >> RestRequest.print_json(response)
  
  => {
    "status_code":200,
    "message":"Success",
    "data":[
        {
            "type":"music",
            "id":"2405669",
            "name":"product",
            "status":"in_setup"
        }
    ]
}

## POST
  
  >> require "rest_request"
  
  => true
  
  >> url = "http://api.example.com/products/"
  
  => "http://api.example.com/products/"
  
  >> data = '{"name":"created by ruby gem","type":"music"}'
  
  => "{\"name\":\"created by ruby gem\",\"type\":\"music\"}"
  
  >> response = RestRequest.send_request("POST", url, data)
  
  => "{\"status_code\":200,\"message\":\"Success\"}"
  
## PUT
  
  >> require "rest_request"
  
  => true
  
  >> url = "http://api.example.com/products/2405669"
  
  => "http://api.example.com/products/2405669"
  
  >> data ='{"name":"updated name by ruby"}'
  
  => "{\"name\":\"updated name by ruby\"}"
  
  >> response = RestRequest.send_request("PUT", url, data)
  
  => "{\"status_code\":200,\"message\":\"Success\"}"

## DELETE
  
  >> require "rest_request"
  
  => true
  
  >> url = "http://api.example.com/products/2405669"
  
  => "http://api.example.com/products/2405669"
  
  >> response = RestRequest.send_request("DELETE", url)
  
  => "{\"status_code\":200,\"message\":\"Success\",\"data\":true}"
  
### Author

[Hector Reyes Aleman](http://birkoff.net/) <[birkoff.h@gmail.com](mailto:birkoff.h@gmail.com)>.

### Copyright

This is free software. See [COPYING](http://github.com/birkoff/ruby_rest_request_gem/master/COPYING) for more information.
 

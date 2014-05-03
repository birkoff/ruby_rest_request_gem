#!/usr/bin/ruby

# Copyright (c) 2012 Hector Reyes Aleman <birkoff.h@gmail.com.com>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


require 'rubygems'
require 'json'
require 'net/http'
require 'uri'

class RestRequest
   
  def self.send_request(method, url, data = nil)
    url = URI.parse(url)
    case method
    when 'GET'
      req = Net::HTTP::Get.new(url.path)
    when 'POST'
      req = Net::HTTP::Post.new(url.path)
    when 'PUT'
      req = Net::HTTP::Put.new(url.path)
    when 'DELETE'
      req = Net::HTTP::Delete.new(url.path)
    end

    req.add_field 'Accept', 'application/json'
    
    if(defined? @@headers) then
      @@headers.each {|key, value| req.add_field key, value }
    end
    
    if(defined? data) then
      req.body = data
    end
    
    res  = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(req)
    end
    
    response_body = JSON.parse(res.body)
  end

  def self.set_header(name, value)
    unless defined? @@headers : @@headers = Hash.new end 
    @@headers[name] = value
  end
  
  def self.clear_headers
    @@headers = nil
  end

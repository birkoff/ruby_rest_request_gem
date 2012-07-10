require 'rubygems'
require 'net/http'

class RestRequest
  
  def send_request(method, url, data = nil)
    case method
    when "GET"
      req = Net::HTTP::Get.new(url.path)
    when "POST"
      req = Net::HTTP::Post.new(url.path)
    when "PUT"
      req = Net::HTTP::Put.new(url.path)
    when "DELETE"
      req = Net::HTTP::Delete.new(url.path)
    end

    req.add_field "Accept", "application/json"
    
    if(defined? @headers) then
      @headers.each {|key, value| req.add_field key, value }
    end
    
    #req.add_field "Referer", $referer 
    
    if(defined? data) then
      req.body = data
    end
    
    res  = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(req)
    end
    
    return res.body
  end

  def set_header(name, value)
    @headers[name] = value
  end
 
  def print_json(data)
    level = 0
    arr = data.split("")
    i = 0
    while (arr[i] != nil)
      if(arr[i] == '{' || arr[i] == '[')
        if(arr[i - 1] == ':')
          print arr[i]
          level = level + 4
          print "\n" + " " * level
        else
          print arr[i]
          level = level + 4
          print "\n" + " " * level
        end
      elsif (arr[i] == '}' || arr[i] == ']')
        if(arr[i+1] == ',')
          print "\n"
          level = level - 4
          print " " * level
          print arr[i]
          i = i + 1
          print arr[i]
          print "\n"
          print " " * level
        else
          print "\n"
          level = level - 4
          print " " * level
          print arr[i]
          #print "\n"
          #print " " * level
        end
      elsif (arr[i] == ',')
        print arr[i]
        print "\n"
        print " " * level
      else
        print arr[i]
      end
      i = i + 1
    end
  end
end

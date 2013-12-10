require 'addressable/uri'
require 'rest-client'

def do_get
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.get(url)
end

def do_post
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s
  # user_data = {:user => {:name =>"Joe", :email => "example@example.com"}}
  user_data = {:user => {}}
  puts RestClient.post(url, user_data)
end

def do_nested_get
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html',
    query_values: {
      'some_category[a_key]' => 'another value',
      'some_category[a_second_key]' => 'yet another value',
      'some_category[inner_inner_hash][key]' => 'value',
      'something_else' => 'aaahhhhh'
    }
  ).to_s

  puts RestClient.get(url)
end

def do_nested_post
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html',
    query_values: {
      'some_category[a_key]' => 'another value',
      'some_category[a_second_key]' => 'yet another value',
      'some_category[inner_inner_hash][key]' => 'value',
      'something_else' => 'aaahhhhh'
    }
  ).to_s

  user_data = {"var1"=>"val1"}
  RestClient.post(url, user_data)
end

def do_show
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s
  RestClient.get(url)
end

def do_destroy
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s
  RestClient.delete(url)
end

def do_update
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2'
  ).to_s
  user_data = {:user => {:name =>"Bob", :email => "example@example.com"}}
  # user_data = {:user => {}}
  puts RestClient.put(url, user_data)
end


p do_update
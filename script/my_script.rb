require 'addressable/uri'
require 'rest-client'

def do_get_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.get(url)
end

def do_post_user
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

def do_nested_get_user
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

def do_nested_post_user
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

def do_show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s
  RestClient.get(url)
end

def do_destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s
  RestClient.delete(url)
end

def do_update_user
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


# ----- Contact ------
def do_get_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts.html'
  ).to_s

  puts RestClient.get(url)
end

def do_post_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts'
  ).to_s
  user_data = {:contact => { :name => "Bob",
                             :email => "example@example.com",
                             :user_id => 2
                             }
                           }
  puts RestClient.post(url, user_data)
end

def do_show_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/1'
  ).to_s
  RestClient.get(url)
end

def do_update_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/1'
  ).to_s
  user_data = {:user => {
      :name =>"Bobby",
      :email => "example@example.com",
      :user_id => 2
    }
  }
  puts RestClient.put(url, user_data)
end

def do_destroy_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/1'
  ).to_s
  RestClient.delete(url)
end

def do_post_contact_share
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contact_shares'
  ).to_s
  user_data = {:contact_share => { :contact_id => 1,
                             :user_id => 3
                             }
                           }
  RestClient.post(url, user_data)
end

def do_destroy_contact_share
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contact_shares/1'
  ).to_s
  RestClient.delete(url)
end

p do_destroy_contact_share
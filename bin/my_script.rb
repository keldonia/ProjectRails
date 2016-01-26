require 'addressable/uri'
require 'rest-client'


def good_create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host:   'localhost',
    port:   3000,
    path:   '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: "Gizmo", email: "gizmo@giz.mo" } }
    )
end

def city_create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host:   'localhost',
    port:   3000,
    path:   '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: "Gizmo" } }
    )
end

def show_me_the_morty
  url = Addressable::URI.new(
    scheme: 'http',
    host:   'localhost',
    port:   3000,
    path:   '/users/2'
  ).to_s

  puts RestClient.get(url)
end

def haz_cheez
  url = Addressable::URI.new(
    scheme: 'http',
    host:   'localhost',
    port:   3000,
    path:   '/users/2'
  ).to_s

  puts RestClient.patch(
    url,
    { user: { email: "y.ham@haz.com" } }
    )
end

def gizless
  url = Addressable::URI.new(
  scheme: 'http',
  host:   'localhost',
  port:   3000,
  path:   '/users/4'
  ).to_s

  puts RestClient.delete(url)
end

# good_create_user
# puts "your existence is futile"
# gizless

city_create_user
# url = Addressable::URI.new(
#   scheme: 'http',
#   host:   'localhost',
#   port:   3000,
#   path:   '/users'
#   # query_values: {
#   #   'some_category[a_key]' => 'another value',
#   #   'some_category[a_second_key]' => 'yet another value',
#   #   'some_category[inner_inner_hash][key]' => 'value',
#   #   'something_else' => 'aaahhhhh'
#   # }
# ).to_s
#
# puts RestClient.get(url)

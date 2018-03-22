# frozen_string_literal: true

# Make sure you have the gem `faker` installed globally
# To serve the files, install the `httpserver` npm module, and start it using:
# http-server -p 8000
# (The built in Python HTTP server in Mac OSX will not be able to keep up with lots of hits, so that’s why you need a more robust static server) (edited)
# obv if you prefer, you can use ngix/whatever

require 'faker'

TOTAL = [10, 0o000].freeze

def filename(i)
  "product-#{i}.html"
end

def page_body(_sku, name, desc, price)
  <<~END
    <h1>#{name}</h1>
    <h2>#{price}</h2>
    <p id='desc'>#{desc}</p>
  END
end

(1..TOTAL).each do |i|
  puts "Generating page #{i}"
  open(filename(i), 'w') do |f|
    sku = Faker::Number.hexadecimal(10)
    name = Faker::Commerce.product_name
    desc = Faker::Lorem.sentence
    price = Faker::Commerce.price
    f.puts page_body(sku, name, desc, price)
  end
end

open('../eee/static/bestbuy', 'w') do |f|
  (1..TOTAL).each do |i|
    f.puts "http://localhost:8000/#{filename(i)}\n"
  end
end

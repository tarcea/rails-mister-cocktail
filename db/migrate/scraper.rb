require 'json'
require 'open-uri'
require 'nokogiri'

cocktail = "margarita"
url = "https://www.liquor.com/recipes/#{cocktail}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# image_url = html_doc.search('.primary-image').attribute('src').nil? ? nil : html_doc.search('.primary-image').attribute('src').value
# title = html_doc.search('.heading__title', 'h1').text.strip
ingredients = html_doc.search('.ingredient-list').each do |ingredient|
      ingredient
  end
  puts ingredients.text.strip

# html_doc.search('.img-placeholder').each do |element|
#   # url_img = element.first_element_child.values[0]
#   puts element
#   # puts element.text.strip
#   # puts element.attribute('src').value
# end

# html_doc.xpath('.img-placeholder').each do |element|
#   # url_img = element.first_element_child.values[0]
#   puts element
#   # puts element.text.strip
#   # puts element.attribute('src').value
# end



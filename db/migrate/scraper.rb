require 'json'
require 'open-uri'
require 'nokogiri'

# cocktail = "bourbon-old-fashioned"
# url = "https://www.liquor.com/recipes/#{cocktail}/"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# image_url = html_doc.search('.primary-image').attribute('src').nil? ? nil : html_doc.search('.primary-image').attribute('src').value
# title = html_doc.search('.heading__title', 'h1').text.strip
# owner = html_doc.search('.figure__caption-owner').text.strip
# ing = html_doc.search('.ingredient-list')
# ing.search('.simple-list__item').each do |ingredient|
#   puts ingredient.text.strip
# end

# ste = html_doc.search('.mntl-sc-block-group--LI')
# count = 0
# steps_all = []
# ste.each do |step|
#   count += 1
#   steps_all << "#{count}. #{step.text.strip}"
# end


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



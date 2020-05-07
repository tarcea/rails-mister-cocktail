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
# food
recipes = []
url = "https://www.annabelkarmel.com/recipes/"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.entry-title').each do |title|
  recipe_title = title.text.strip
  recipe_url = title.first_element_child.attribute('href')
  recipe_file = open(recipe_url).read
  recipe_doc = Nokogiri::HTML(recipe_file)
  recipe_doc.search('.has-dark-blue-color').each do |dd|
  recipe_typ = dd.text.strip
  end
  recipe_doc.search('.recipes-icons').each do |ee|
    recipe_details = ee.text.strip
  end
  recipe_doc.search('.columns').each do |ff|
    recipe_ingredients = ff.text.strip
  end
  recipe_doc.search('.padding-horizontal-large').each do |gg|
    recipe_methodes = gg.first_element_child
  end
end



















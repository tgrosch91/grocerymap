require_relative '../config/environment.rb'
require 'pry'

puts "Hello! Welcome to Cat Characteristics!"
puts "                               _"
puts "                              | |"
puts "                              | |"
puts "                              | |"
puts "         |\_/|                | |"
puts "         /, ~\                / /"
puts "        X     `-.....-------./ /"
puts "          ~-. ~  ~              |"
puts "             \             /    |"
puts "              \  /_     ___\   /"
puts "              | /\ ~~~~~   \ |"
puts "              | | \        || |"
puts "              | |\ \       || )"
puts "             (_/ (_/      ((_/"
puts "copyright-https://user.xmission.com/~emailbox/ascii_cats.htm"
puts ""
puts ""
puts "Please enter your zipcode:"
zip = gets.chomp
url = get_url_from_zipcode(zip)
scraper = Scraper.new
cat_link_array = scraper.get_individual_links(url)
cat_hash_array = send_links_to_scraper(scraper, cat_link_array)
hash_array_to_object(cat_hash_array)
puts "Here are the first 16 cats in your area."
cat_name_array = Cat.all_cat_names
choices_array = ["Gender", "Breed", "Age", "Shelter"]
def response_choices(cat_name_array,choices_array)
	response = gets.chomp
	if cat_name_array.include?(response)
		see_cat_details(response)
	elsif choices_array.include?(response)
		see_options(response)
	else puts "That is not a valid response. Please enter a name or an attribute to search by:"
		response_choices(cat_name_array, choices_array)
	end
end
puts "If you would like to see more details, please enter the cat's name."
puts "If you would like to search by attribute, please enter either Gender, Breed, Age, or Shelter to see the available options."
response_choices(cat_name_array,choices_array)

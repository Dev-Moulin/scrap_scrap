
require 'rubygems'
require 'open-uri'   #ouvrire un site web
require 'nokogiri'   #accèe à chaque noeud du site web pour scarp


def scraping(page)    
     for_array = []
     page.xpath('//td[contains(@class, "cmc-table__cell--sort-by__symbol")]').each do |element|
         for_array << element.text
     end 
     return for_array
end
def scraping_prix(page)    
    for_array_price = [] 
    page.xpath('//td[contains(@class, "cmc-table__cell--sort-by__price")]').each do |element|
        element = element.text.gsub('$', '').gsub(',', '').to_f
        for_array_price << element
    end 
    
    return for_array_price
end
def le_hash(scraping, scraping_prix)
    array_hash = {}
    array_hash = scraping.zip(scraping_prix).to_h
   
    return array_hash
end

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
puts le_hash(scraping(page), scraping_prix(page))



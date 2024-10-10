
require 'rubygems'
require 'open-uri'   #ouvrire un site web
require 'nokogiri'   #accèe à chaque noeud du site web pour scarp



def reucp_page
    array_url = []
    7.times do |i| 
        array_url << "https://lannuaire.service-public.fr/navigation/ile-de-france/val-d-oise/mairie?page=#{i + 1}" 
    end
    return array_url
end

def get_townhall_email(townhall_email)# recup email mairie
    doc = Nokogiri::HTML(URI.open(townhall_email))
    link_email = doc.css('a.send-mail').text
    return link_email
end

def get_townhall_urls (townhall_url)# recup url mairie
    doc = Nokogiri::HTML(URI.open(townhall_url))
    links_url = doc.css('a.fr-link').map{|ligne| ligne['href']}.drop(4)
    links_email = links_url.map{|townhall_email| get_townhall_email(townhall_email)} 
    return links_url
    
end


 puts get_townhall_email ("https://lannuaire.service-public.fr/ile-de-france/val-d-oise/db98821b-0546-42e0-8e5b-0ee52d2dac5a")
 puts get_townhall_urls ("https://lannuaire.service-public.fr/navigation/ile-de-france/val-d-oise/mairie?page=1")

 
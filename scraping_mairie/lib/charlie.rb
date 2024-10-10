def get_townhall_urls(numero)
    doc = Nokogiri::HTML(URI.open("https://lannuaire.service-public.fr/navigation/ile-de-france/val-d-oise/mairie?page=#{numero}"))
    ville = doc.css('a.fr-link').map { |node| node.text.gsub("Mairie - ", "") } .drop(4)

    townhall_url = doc.css('a.fr-link').map { |node| node['href'] } .drop(4)
    
    townhall_email = townhall_url.map { |lien| get_townhall_email(lien)}
    hash = ville.zip(townhall_email).to_h
  ends
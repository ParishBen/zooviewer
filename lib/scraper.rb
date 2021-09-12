class Zooviewer::Scraper


  URL = "https://vacationidea.com/ideas/best-zoos.html"

  def self.get_zoos
    zooarr= []
    
    res = Nokogiri::HTML(open(URL))
        res.css("div.slideshow").each do |heading|
        zoo_name_rank = heading.css("h2").children[1].text.strip
        rzoo_name_rank = zoo_name_rank.sub(/^Best Zoos in America+\W/, '').strip.sub(/^Best Zoos in the U+\W+S+\W+/, '').sub(/^Top zoos in the US\W/,'').strip
        
          heading.css("div.slide-caption").each do |paragraph|
          zoo_paragraph = paragraph.css("p").first.text.strip
          zoo_address = paragraph.css("p").css("i").text.strip
        zooarr << {name: rzoo_name_rank, details: zoo_paragraph, address: zoo_address} 
        end
       end
        Zooviewer::Zoo.create_from_scraper(zooarr)
       end
      end
  
    







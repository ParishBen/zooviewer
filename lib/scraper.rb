


class Zooviewer::Scraper

    
  URL = "https://vacationidea.com/ideas/best-zoos.html"

  def self.get_zoos
    zooarr= []
    res = Nokogiri::HTML(open(URL))
        res.css("div.slideshow").each do |heading|
        zoo_name_rank = heading.css("h2").text.strip
          heading.css("div.slide-caption").each do |paragraph|
          zoo_paragraph = paragraph.css("p").first.text.strip
          zoo_address = paragraph.css("p").css("i").text.strip
        zooarr << {name: zoo_name_rank, details: zoo_paragraph, address: zoo_address} 
      end
     end

    Zoo.create_from_scraper(zooarr)
    
   end
 
#    def self.pull_details(i)
#    zoo_obj= Zoo.all[i]
#    zoo = zooarr[2]
#    zoo.name = @name
#    zoo.details = @details
#    zoo.address = @address

#    puts zoo.address
#  end

  def self.get_zoo_details(obj)
    obj.name = @name
    obj.details = @details
    obj.address = @address
  end


end







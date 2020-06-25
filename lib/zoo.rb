class Zooviewer::Zoo
    @@all=[]
attr_accessor :name, :details, :address 

    def initialize(name, details, address)
        @name, @details, @address = name, details, address
        save
    end
    
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create_from_scraper(zooarr)
        zooarr.each do |zoohash|
            self.new(zoohash[:name],zoohash[:details], zoohash[:address])
            end 
        end
    
     


     def self.individual_zoo_details(input)
       zoo= @@all[input]
        <<-DES
        \n\tZoo Name: #{zoo.name}\n
        To Visit: #{zoo.address}\n\n
        Fun Facts =>\t #{zoo.details}\n
        DES
    
     end
     
    

end

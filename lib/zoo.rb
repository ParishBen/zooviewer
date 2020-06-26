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
       zoo= @@all[input.to_i]
        <<-DES
        \n\tZoo ##{zoo.name}, is a great choice!\n
        To Visit: #{zoo.address}\n\n
        Fun Facts =>\t #{zoo.details}\n
        DES
    
     end
     
    

end

require 'pry'

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
    
     def zoo_details
        <<-DES
        Zoo Name: #{self.name}
        To Visit: #{self.address}
        About: #{self.details}
        DES
     end
end

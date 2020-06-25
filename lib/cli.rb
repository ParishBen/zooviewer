class Zooviewer::CLI

    def start
        introduction
        get_zoo_data
        main_loop
        goodbye
    end
    
    def introduction
        puts "\n\n"
        puts "Welcome to the ZooViewer!\nWe've scoured the country & came up with the BEST Zoos in the country that are great enough to plan you next trip around!\n"
        sleep(4)
        puts "\n\n"
    end
    def display_instructions
        sleep(3)
        puts "\n\n"
        puts "Here's our Top 25. Please enter a number to get that Zoo's info or type 'exit' to exit the program"
        
        puts "\n\n"
    end

    def get_zoo_data
        Zooviewer::Scraper.get_zoos
    end

    def display_zoos
        zoos = Zooviewer::Zoo.all
       zoos.each do |zoo|
        puts "#{zoo.name}"
        end
    end
    def get_zoo_choice
        input = gets.strip.downcase
        
        return input.downcase if input.downcase == "exit"
        if input.to_i.between?(1, Zooviewer::Zoo.all.length)
            return input.to_i - 1
        else
            puts "Sorry that's not in the list, please try another"
             get_zoo_choice
        end
    end
    
    def main_loop
        loop do 
            menu
            input= get_zoo_choice
              case input
              when "exit"
                 break
              else
              display_zoo_choice(input)
            end
        end
     end
    def menu 
        display_zoos
        display_instructions
      end

     def display_zoo_choice(i)
        puts Zooviewer::Zoo.individual_zoo_details(i)
        puts "press any key to continue"
        gets
     end

     def goodbye
        puts "We hope you enjoy your trip!"
     end
    end
    
    #Zooviewer::CLI.introduction
    
    
    
    
class Cli

    def run
        puts " • • • • • WELCOME TO STUDIO GHIBLI FILMS • • • • • ".colorize(:cyan)
        sleep(1)
        Api.get_movies
        movie_list
        movie_selection
        selection
    end
    
    def print_all
        Studio_Ghibli.all.each.with_index(1) do |list, index|
            puts "#{index}. #{movie.title}"
        end
    end

    def print_movie_titles
        Studio_Ghibli.all.each.with_index(1) do |movie, index|
            puts "#{index}. #{movie.title}".colorize(:light_magenta)
        end
    end  

    def movie_list
        puts "Would you like to see the list of movies playing this week? y/n"
        input = gets.chomp.downcase
        if input == "yes" || input == "y"
           print_movie_titles
           puts "Please select a movie number:".colorize(:cyan)
        else
           puts "Goodbye"
        end
    end

    def movie_selection
        last_element = Studio_Ghibli.all.size - 1    
        input = gets.chomp.to_i
        index = input.to_i - 1
        if index.between?(0,last_element) 
            display_movie(index)
        else
            puts "Invalid input. Let's try again.".colorize(:light_red)     
            movie_selection
        end
    end

    def display_movie(index)
        system "clear"
        movie = Studio_Ghibli.all[index]
        puts "Movie Title: #{movie.title}"
        puts "Release Date: #{movie.release_date}"
        puts "Director: #{movie.director}"
        puts "Description: #{movie.description}"
    end
  
    def selection
        puts "\n\nWould you like to pick another movie? y/n".colorize(:cyan)
        input = gets.chomp.downcase
        if input == "yes" || input == "y"
            print_movie_titles
            movie_selection
            selection
        else 
            puts "Goodbye"
        end
    end
end


 
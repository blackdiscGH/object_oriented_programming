
def clear_screen
	puts "\e[H\e[2J"

	puts " *** 2 Rovers on Mars ***"
	puts "Version 1.0"
	puts "Avinash Jham"
	puts "\n\n\n"
end

###############################################################################################################

class Rover
	attr_accessor :xcoord
	attr_accessor :ycoord
	attr_accessor :direction

#@@num_of_rovers += 1

		def initialize
			# @xcoord = x
			# @ycoord = y
			# @direction = d
		end

		# will read the instruction
		def read_instruction(the_plateau,paint_color)

			puts "Enter Start Position in the format [x: Number] [y: Number] [orientation N/S/E/W] E.g. 3 3 N" 
			line1=gets.chomp  # initial start position
			puts "Enter Moves and Turns required .. using L for left, R for right, M to move ahead. E.g. LLRMRL" 
			line2=gets.chomp  # A series of move and turn instructions

			array = Array.new
			array = line1.split(' ')

			@starting_position = {
				:starting_x => array[0],
				:starting_y => array[1],
				:starting_d => array[2],
			} 

			@xcoord = @starting_position[:starting_x]
			@ycoord = @starting_position[:starting_y]
			@direction = @starting_position[:starting_d]
			the_plateau.plot_rover(@xcoord,@ycoord,paint_color)


			@moves_n_turns = Array.new
			@moves_n_turns = line2.split('')

			# puts @starting_position
			# puts @moves_n_turns

		end

		# move will operate it in x,y mode and also rotate it
		def moves_n_turns(the_plateau,paint_color)
			@moves_n_turns.each do |n|

				case n
				when "L"
					case @direction
						when "N"
							@direction = "W"
						when "W"
							@direction = "S"
						when "S"
							@direction = "E"
						when "E"
							@direction = "N"
					end

				when "R"
					case @direction
						when "N"
							@direction = "E"
						when "W"
							@direction = "N"
						when "E"
							@direction = "S"
						when "S"
							@direction = "W"
					end
					
				when "M"

					case @direction
						when "N"
							@ycoord = @ycoord.to_i + 1
							the_plateau.plot_rover(@xcoord,@ycoord,paint_color)
						when "W"
							@xcoord = @xcoord.to_i - 1
							the_plateau.plot_rover(@xcoord,@ycoord,paint_color)
						when "E"
							@xcoord = @xcoord.to_i + 1
							the_plateau.plot_rover(@xcoord,@ycoord,paint_color)
						when "S"
							@ycoord = @ycoord.to_i - 1
							the_plateau.plot_rover(@xcoord,@ycoord,paint_color)
					end # End of Case direction
				end # End of case n

				the_plateau.plot_rover_final_position(@xcoord,@ycoord,@direction,paint_color)

			end # End of Method Moves_n_turns
		end

		def list_coord
			puts "#{@xcoord} #{@ycoord} #{@direction}"
		end 

		def print_num_of_rovers
			# @@num_of_rovers
		end

end
	

############ End of Class Rover ###################################################################################

class String

    def red; colorize(self, "\e[1m\e[31m"); end
    def green; colorize(self, "\e[1m\e[32m"); end
    def dark_green; colorize(self, "\e[32m"); end
    def yellow; colorize(self, "\e[1m\e[33m"); end
    def blue; colorize(self, "\e[1m\e[34m"); end
    def dark_blue; colorize(self, "\e[34m"); end
    def pur; colorize(self, "\e[1m\e[35m"); end
    def colorize(text, color_code)  "#{color_code}#{text}\e[0m" end
end

############ End of Class String ###################################################################################



class Plateau
	attr_accessor :x_size
	attr_accessor :y_size

	def initialize(xsize,ysize)
		@x_size = xsize
		@y_size = ysize
		@plateau_grid = Array.new(@y_size) { Array.new(@x_size," . ") }

		# Loop over each row array.
		@plateau_grid.each do |x|

    		# Loop over each cell in the row.
    		x.each do |cell|
				print " #{cell} "
    		end
   			 # End of row.
    	print "\n"
		end

	end


	def plot_rover(xcoord,ycoord,paint_color)
		case paint_color
		when "Red"
			@plateau_grid[ycoord.to_i-1][xcoord.to_i-1] = " * ".red
		when "Blue"
			@plateau_grid[ycoord.to_i-1][xcoord.to_i-1] = " * ".blue
		end 
	end 

	def plot_rover_final_position(x,y,d,paint_color)
		
		if paint_color == "Red"
			case d
				when "N" 
					@plateau_grid[y.to_i-1][x.to_i-1] = " ^ ".red
				when "S" 
					@plateau_grid[y.to_i-1][x.to_i-1] = " V ".red
				when "W" 
					@plateau_grid[y.to_i-1][x.to_i-1] = " < ".red
				when "E" 
					@plateau_grid[y.to_i-1][x.to_i-1] = " > ".red
			end
		elsif paint_color == "Blue"
			case d
				when "N" 
					@plateau_grid[y.to_i-1][x.to_i-1] = " ^ ".blue
				when "S" 
					@plateau_grid[y.to_i-1][x.to_i-1] = " V ".blue
				when "W" 
					@plateau_grid[y.to_i-1][x.to_i-1] = " < ".blue
				when "E" 
					@plateau_grid[y.to_i-1][x.to_i-1] = " > ".blue
			end
		else
		end 
	end 

	def print_new
		clear_screen
		@plateau_grid.reverse.each do |y|
    		# Loop over each cell in the row.
    		y.each do |x|
    			print x
    		end
   			 # End of row.
    	print "\n"
		end
		
	end


end

############ End of Class Plateau ###########################################

clear_screen

plateau = Plateau.new(10,10)

puts "\n\n\n"
puts "Activating Rover 1"
rover1 = Rover.new
rover1.read_instruction(plateau,"Red")
rover1.moves_n_turns(plateau,"Red")
rover1.list_coord

puts "\n\n\n"
puts "Activating Rover 2"
rover2 = Rover.new
rover2.read_instruction(plateau,"Blue")
rover2.moves_n_turns(plateau,"Blue")
rover2.list_coord

plateau.print_new



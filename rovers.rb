class Rover
	attr_accessor :xcoord
	attr_accessor :ycoord
	attr_accessor :direction

		def initialize
			# @xcoord = x
			# @ycoord = y
			# @direction = d
		end

		# will read the instruction
		def read_instruction

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

			@moves_n_turns = Array.new
			@moves_n_turns = line2.split('')

			puts @starting_position
			puts @moves_n_turns

		end

		# move will operate it in x,y mode and also rotate it
		def moves_n_turns
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
						when "W"
							@xcoord = @xcoord.to_i - 1
						when "E"
							@ycoord = @ycoord.to_i - 1
						when "S"
							@xcoord = @xcoord.to_i + 1
					end # End of Case
				end # End of Case
			end # End of Method Moves_n_turns
		end

		def print_coord
			puts "#{@xcoord} #{@ycoord} #{@direction}"
		end 
end
	
class Plateau
	attr_accessor :x_size
	attr_accessor :y_size
end

puts "Activating Rover 1"
rover1 = Rover.new
rover1.read_instruction
rover1.moves_n_turns
rover1.print_coord

puts "Activating Rover 2"
rover2 = Rover.new
rover2.read_instruction
rover2.moves_n_turns
rover2.print_coord


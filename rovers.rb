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

			@moves_n_turns = Array.new
			@moves_n_turns = line2.split('')

			puts @starting_position
			puts @moves_n_turns

		end

		# move will operate it in x,y mode
		def move



		end

		# turn will rotate it with L,R
		def turn
		end


end


class Plateau
	attr_accessor :x_size
	attr_accessor :y_size
end

rover1 = Rover.new

rover1.read_instruction

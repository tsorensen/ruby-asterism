## Section 13.4 - Orange Tree class ##



class OrangeTree

	def initialize
		@initial_height = rand(8) + 5
		line_width = 50
		puts "The sun is out shining and you".center(line_width)
		puts "planted your orange tree!".center(line_width)
		puts
		puts "After a couple months, your tree is #{@initial_height} inches tall!"
		puts
		puts "Now's the hard part, taking".center(line_width)
		puts "really good care of it!".center(line_width)
		puts
		puts "Be SURE to water your tree at least twice a year or it will dry out!!!"
		#  menu2
		@watering = 0 ##water method
		@years_old = 0
		@height = @initial_height
		@oranges_quantity = 0
		@count = 0
		## sun shine, tree growth,
		## gives initial height, passes 1 year
	end
	
	def height 
		if @height > 240
			@height = 240
			puts "Your tree has reached its max height! It is 20 feet tall!"
		## height method that returns tree's current height.
		## height needs to max out at a certain number of years.
		else
			feet = @height / 12
			inches = @height % 12
			if feet == 1
				if inches == 1
					puts "Your tree is #{feet} foot #{inches} inch tall!"  ## 'inches' and 'foot' singular
				else
					puts "Your tree is #{feet} foot #{inches} inches tall!"  ## 'foot' singular
				end
			else
				if inches == 1
					puts "Your tree is #{feet} feet #{inches} inch tall!" ## just 'inches' singular
				else
					puts "Your tree is #{feet} feet #{inches} inches tall!"
				end
			end
		end
	end
	
	def water  ## water your tree method
		@watering = @watering + 1
		if @watering == 1
			puts "(You water your tree from time-to-time)"
			puts "Great job! Keep watering it!"
			if @height < 240
				@height = @height + (rand(8) + 5)
			end
		elsif @watering > 1 && @watering < 4
			puts "(You water your tree frequently)"
			puts "Awesome! It is growing up big and strong!"
			if @height < 240
				@height = @height + (rand(8) + 7)
			end
		elsif @watering >= 4 && @watering < 6
			puts "(You water your tree all the time)"
			puts "Whoa...all things in moderation now..."
			if @height < 240
				@height = @height + (rand(8) + 2)
			end
		elsif
			puts "(You over-water your tree) \nYou're drowning it!"
		end
		#  menu2
		## waters your tree month to month
	end
	
	def grow_oranges
		if @years_old > 3
			if @count == 0
				@oranges_quantity = (@watering ** 2)+ (@years_old ** 2)
				@count = 1
			else
			end
		else
		end	
	end
	
	def count_oranges  ## count_the_oranges method
		if @years_old > 3
			if @count == 0
				@oranges_quantity = (@watering ** 2)+ (@years_old ** 2)
				puts "Current oranges count: #{@oranges_quantity}"
				@count = 1
			else
				puts "Current oranges count: #{@oranges_quantity}"
			end
		else
			puts "Your tree is too young to produce fruit!"
			puts "Keep nurturing it!"
		end	
	end
	
	def pick_oranges  ## pick_an_orange method that reduces fruit count
		if @years_old > 3
			if @oranges_quantity > 0
				puts "How many oranges would you like to pick?"
				puts "(Put 1 to #{@oranges_quantity}.)"
				@picking_oranges = gets.chomp.to_i ## how many?
				if @picking_oranges > 0 && @picking_oranges <= @oranges_quantity
					if @picking_oranges.to_i == 1
						puts "You picked #{@picking_oranges} orange. Delicious!"
						@oranges_quantity = @oranges_quantity - @picking_oranges
						@input = false
					else 
						puts "You picked #{@picking_oranges} oranges. So good!"
						@oranges_quantity = @oranges_quantity - @picking_oranges
						@input = false
					end
				else 
					puts "Sorry, that's not a valid number of oranges to pick."
				end
			else
				puts "Sorry but you have picked all your oranges already!!"
			end
		else
			puts "Your tree is to young to produce fruit!"
			puts "Keep nurturing it!"
		end
	end
	
	def one_year_passes   ## age one year method  
		## sun shine, tree growth,
		## oranges that weren't picked need to fall off the tree
		## death method where tree dies after a certain number of years.
		## they can choose how many years to pass. if > 20, tree dies
		puts
		puts "(One year passes)"
		puts "Time flies when you're having fun!"
		puts
		if leftover_oranges?
			puts "You forgot to pick all of your oranges!!"
			if @oranges_quantity == 1
				puts "1 orange fell of the tree and is rotten."
			elsif @oranges_quantity > 200
				puts "Holy FREAKING crap...you just let hundreds of oranges fall off the tree and rot on the ground."
			else
				puts "#{@oranges_quantity} oranges all fell off the tree and are rotten!"
				puts "Disgusting.."
			end
		end
		puts "Age of your tree in years: #{(@years_old) + 1}"
		puts
		if over_water?
			puts "You over-watered your tree and it drowned."
			puts "Your tree is dead."
			exit
		end
		if watered_enough?  		### DID THEY WATER ENOUGH????
			puts "You didn't water your tree enough!"
			puts "It dried out and died!!"
			exit 
		end
		if tree_dies?
			puts "Your tree has died due to old age."
			puts "Plant another tree and play again!"
			exit
		end
		
		@watering = 0
		@oranges_quantity = 0
		@count = 0
		@years_old += 1
		
	end
	
	def kill
		## kill your tree
		puts "You kill your tree.  How terrible!"
		puts "Game over"
	end
	
	
private
	
	def leftover_oranges?  # if they didn't pick all oranges
		@oranges_quantity > 0
	end
	
	def watered_enough?
		@watering <= 1
	end
	
	def over_water?
		@watering > 6
	end
	
	def tree_dies?
		@years_old >= 20
		## after certain number of years
		## if it is not watered
	end
	
end





def menu1
	  ## menu of some sort  - welcome and what you want to do with your tree after planting
	puts @watering
	puts "What would you like to do?".center(50)
	puts
	puts "1  Plant an orange tree"
	puts "2  Exit program" 
	puts
	@menu_response = gets.chomp
	if @menu_response.to_i == 1
		@tree = OrangeTree.new    #### pickup from here
		menu2
	elsif @menu_response.to_i == 2
		puts
		puts "Are you sure?"
		leave
	else
		error_menu1
	end
end	
def error_menu1
	## throws an error for invalid input
	puts
	puts "ERROR: unrecognized response"
	menu1
end
def leave
	## if they want to exit the program already.
	print "Please type 'yes' or 'no': "
	@response = gets.chomp.downcase
	if @response == "yes"
		puts
		puts "Bye!"
	elsif @response == "no"
		menu1
	else
		leave
	end
end
def leave2
	## if they want to exit the program already.
	print "Please type 'yes' or 'no': "
	@response = gets.chomp.downcase
	if @response == "yes"
		puts
		puts "Bye!"
	elsif @response == "no"
		menu2
	else
		leave
	end
end
def kill_tree_or_not
	## if they want to kill their tree
	puts
	puts "Do you really want to kill your tree?!?!"
	print "Please type 'yes' or 'no': "
	@response = gets.chomp.downcase
	if @response == "yes"
		puts
		@tree.kill
	elsif @response == "no"
		menu2
	else
		kill_tree_or_not
	end
end

def menu2
	puts 
	puts "What would you like to do?"
	puts "1  Water your tree"
	puts "2  Check the tree's height"
	puts "3  Count your oranges"
	puts "4  Pick oranges"
	puts "5  Pass one year"
	puts "6  Kill your tree"
	puts "7  Quit program"
	puts
	@menu2_response = gets.chomp
	
	if @menu2_response.to_i == 1
		@tree.water
		menu2
	elsif @menu2_response.to_i == 2
		@tree.height
		menu2
	elsif @menu2_response.to_i == 3
		@tree.count_oranges
		menu2
	elsif @menu2_response.to_i == 4
		@tree.pick_oranges
		menu2
	elsif @menu2_response.to_i == 5
		@tree.one_year_passes
		@tree.grow_oranges
		menu2
	elsif @menu2_response.to_i == 6
		kill_tree_or_not
	elsif @menu2_response.to_i == 7
		puts "Do you really want to leave?"
		leave2
	else
		error_menu2
	end
end
def error_menu2
		## throws an error for invalid input
	puts
	puts "ERROR: I don't understand. Try again."
	menu2
end

## executable lines
puts "Hello and welcome to Florida Oranges!".center(50)
puts "Plant your orange tree and lets get started!".center(50)
menu1	 
	

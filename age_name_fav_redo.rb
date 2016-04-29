require_relative "helper_functions.rb"

def start
	get_name
	get_age
	get_fav_numbers
	sum_of_fav_numbers
end

def get_name
	puts "What is your name?"
	@name = gets.chomp
end	

def get_age
	puts "Hello #{@name}, what is your age?"
	@age = gets.chomp
end

def get_fav_numbers
	@favorite_numbers = []
	puts "#{@name}, what are your 3 favorite numbers?"
	3.times do	
		number = gets.chomp			
		@favorite_numbers << number.to_i
	end
end

def sum_of_fav_numbers
	sum = sum(@favorite_numbers[0],@favorite_numbers[1],@favorite_numbers[2])
	if sum < @age.to_i
 		puts "#{@name}, The sum of #{sum} is less than your age."
 	elsif sum > @age.to_i
 		puts "#{@name}, The sum of #{sum} is greater than age."
 	else
 		puts "#{@name}, The sum of #{sum} is equal to age."
 	end
end
start
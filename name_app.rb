require 'sinatra'

get '/' do
	erb :age_name_app
end

post '/input' do
	@@name = params[:user_name]
	erb :age_app, :locals => {:name => @@name}
end

post '/age' do
	@@age = params[:user_age]
	erb :favorite_numbers, :locals => {:age => @@age, :name => @@name}
end	

post '/favorite_numbers' do
	favorite_numbers1 = params[:user_favorite_number1]
	favorite_numbers2 = params[:user_favorite_number2]
	favorite_numbers3 = params[:user_favorite_number3]
	sum = favorite_numbers1.to_i + favorite_numbers2.to_i + favorite_numbers3.to_i
	if sum < @@age.to_i
		erb :sum_numbers, :locals => {:sum => sum, :fav1 => favorite_numbers1, :fav2 => favorite_numbers2, :fav3 => favorite_numbers3, :result => "That is less then your age!"}
	else
		erb :sum_numbers, :locals => {:sum => sum, :fav1 => favorite_numbers1, :fav2 => favorite_numbers2, :fav3 => favorite_numbers3, :result => "That is greater then your age!"}
	end		
end	


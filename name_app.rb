require 'sinatra'
enable :sessions

get '/' do
	erb :age_name_app
end

post '/input' do
	session[:name] = params[:user_name]
	erb :age_app, :locals => {:name => session[:name]}
end

post '/age' do
	session[:age] = params[:user_age]
	erb :favorite_numbers, :locals => {:age => session[:age], :name => session[:name]}
end	

post '/favorite_numbers' do
	favorite_numbers1 = params[:user_favorite_number1]
	favorite_numbers2 = params[:user_favorite_number2]
	favorite_numbers3 = params[:user_favorite_number3]
	sum = favorite_numbers1.to_i + favorite_numbers2.to_i + favorite_numbers3.to_i
	if sum < session[:age].to_i
		erb :sum_numbers, :locals => {:sum => sum, :fav1 => favorite_numbers1, :fav2 => favorite_numbers2, :fav3 => favorite_numbers3, :result => "That sum is less than your age!", :name => session[:name]}
	else
		erb :sum_numbers, :locals => {:sum => sum, :fav1 => favorite_numbers1, :fav2 => favorite_numbers2, :fav3 => favorite_numbers3, :result => "That sum is greater than your age!", :name => session[:name]}
	end		
end	


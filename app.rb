require 'sinatra'
require 'holidapi'

class MyWebApp < Sinatra::Base
  get '/' do
    erb :form
  end
  get '/holidays' do
  	if params['year'] != nil && params['year'] != ""
  		if params['month'] != nil && params['month'] != ""
  			if params['day'] != nil && params['day'] != ""
  				@holidays = HolidApi.get(year: params['year'], month: params['month'], day: params['day']).flatten
  			else
  				@holidays = HolidApi.get(year: params['year'], month: params['month']).flatten
  			end
  		end
  	end
    erb :index
  end
end
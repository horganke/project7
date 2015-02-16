require 'sinatra'
require 'holidapi'

class MyWebApp < Sinatra::Base
  get '/' do
    erb :form
  end
  get '/holidays' do
    @holidays = HolidApi.get(day: params['day'], month: params['month'], year: params['year'])
    puts params
    puts @holidays
    erb :index
  end
end
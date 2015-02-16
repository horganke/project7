# app.rb
require 'sinatra'
require 'holidapi'

class MyWebApp < Sinatra::Base
  get '/' do
    @holidays = HolidApi.get
    @holidays_current = HolidApi.get(month: (Date.today.strftime('%m')), year: (Date.today.strftime('%Y')))
    @holidays_birth = HolidApi.get(year:1993,month:10,country: 'us')
    erb :index
  end
end
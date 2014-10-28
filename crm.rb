require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new

get '/' do
	@crm_app_name = "Vincent's CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	 erb :new_contact
end

post '/contacts' do
	puts params
end
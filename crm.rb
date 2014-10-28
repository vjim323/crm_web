require 'sinatra'

get '/' do
	@crm_app_name = "Vincent's CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end

# gets '/contacts/new' do
# 	erb 
# end
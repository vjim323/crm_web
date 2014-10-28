require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

get '/' do
	@crm_app_name = "Vincent's CRM"
	erb :index
end

get '/contacts' do
	@contacts = []
	@contacts << Contacts.new("Vincent", "Jim", "vjim323@gmail.com", "None")
	@contacts << Contacts.new("Kent", "Jim", "kjim@gmail.com", "None")

	erb :contacts
end

# gets '/contacts/new' do
	 
# end
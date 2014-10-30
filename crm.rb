require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

@@rolodex = Rolodex.new
@@rolodex.add_contact(Contacts.new("Vincent", "Jim", "vjim323@gmail.com", "nothing"))

get '/' do
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
	new_contact = Contacts.new(params[:first_name], params[:last_name], params[:email], params[:notes])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')
end

get '/contacts/1000' do
	@contact = @@rolodex.find(1000)
	erb :show_contact
end

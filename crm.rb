require_relative 'rolodex'

require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contacts
	include DataMapper::Resource

	property :id, Serial
	property :first_name, String
	property :last_name, String
	property :email, String
	property :notes, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

@@rolodex = Rolodex.new

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
	@@rolodex.add_contact(new_contact)
	redirect to('/contacts')
end

get '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get '/contacts/:id/edit' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

put '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.notes = params[:notes]

		redirect to('/contacts')
	else 
		raise Sinatra::NotFound
	end
end

delete '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		@@rolodex.remove_contact(@contact)

		redirect to('/contacts')
	else
		raise Sinatra::NotFound
	end
end

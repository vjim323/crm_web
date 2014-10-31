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

get '/' do
	erb :index
end

get '/contacts' do
	@contacts = Contacts.all
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
	new_contact = Contacts.create(
		:first_name => params[:first_name],
		:last_name => params[:last_name],
		:email => params[:email],
		:notes => params[:notes]
		)

	redirect to('/contacts')
end

get '/contacts/:id' do
	@contact = Contacts.get(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get '/contacts/:id/edit' do
	@contact = Contacts.get(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

put '/contacts/:id' do
	@contact = Contacts.get(params[:id].to_i)
	if @contact
		update_contact = @contact.update(
			:first_name => params[:first_name],
			:last_name => params[:last_name],
			:email => params[:email],
			:notes => params[:notes]
			)

		redirect to('/contacts')
	else 
		raise Sinatra::NotFound
	end
end

delete '/contacts/:id' do
	@contact = Contacts.get(params[:id].to_i)
	if @contact
		@contact.destroy

		redirect to('/contacts')
	else
		raise Sinatra::NotFound
	end
end

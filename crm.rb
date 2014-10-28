require 'sinatra'

get '/' do
	@crm_app_name = "Vincent's CRM"
	erb :index
end
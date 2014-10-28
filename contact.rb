class Contacts
	attr_accessor :first_name, :last_name, :email, :notes, :id
# attr_accessor id so that it can be changed from the rolodex file

	def initialize(first_name, last_name, email, notes)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
	end

end
require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/phone')

get('/') do
  @phone_book = Contact.all()
  erb(:form)
end

get('/add_contact')
  name = params.fetch('name')
  contact = Contact.new({:name => @name})
  contact.save()
  Contact.reassign_ids()
  redirect '/'
end

get('/contacts/:id')
  end

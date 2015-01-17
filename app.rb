require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/phone')

get('/') do
  Contact.reassign_ids()
  @phone_book = Contact.all()
  erb(:form)
end

post('/add_contact') do
  @name = params.fetch('name')
  contact = Contact.new({:name => @name})
  contact.save()
  Contact.reassign_ids()
  redirect '/'
end

get('/contacts/:id') do
  @contact = Contact.find_contact_by_id(params.fetch('id').to_i)
  erb(:contacts)
end

post('/delete_contact') do
  @id = params.fetch('id').to_i
  @contact = Contact.find_contact_by_id(@id)
  Contact.delete_contact(@contact)
  Contact.reassign_ids()
  redirect '/'
end

post('/delete_phone') do
  @id = params.fetch('id').to_i
  @phone_index = params.fetch('index_counter').to_i
  @contact = Contact.find_contact_by_id(@id)
  @contact.delete_phone_at_index(@phone_index)
  redirect"/contacts/#{@id}"
end

post('/add_phone') do
  @number = params[:number]
  @type = params[:type]
  @carrier = params[:carrier]
  @id = params.fetch('id').to_i
  @phone = Phone.new({:number => @number, :type => @type, :carrier => @carrier})
  @contact = Contact.find_contact_by_id(@id)
  @contact.add_phone(@phone)
  redirect "/contacts/#{@id}"
end

post('/search') do
  @findme = params.fetch('findme')
  @results = Contact.find_contact_by_name(@findme)
  erb(:search_results)
end

class Contact
  attr_reader(:contact)


  @@phone_book = []

  define_method(:initialize) do |attributes|
    @contact = attributes.fetch(:contact)
    @phone = []
    @phone.push(attributes.fetch(:phone))
  end

  # INSTANCE METHODS

  define_method(:add_phone) do |new_number|
    #TODO
  end

  define_method(:save) do
    @@phone_book.push(self)
  end

  define_method(:delete_contact) do
    #TODO
  end





  # CLASS METHODS

  define_singleton_method(:clear) do
    @@phone_book = []
  end

  define_singleton_method(:all) do
    @@phone_book
  end

end

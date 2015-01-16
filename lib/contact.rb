class Contact
  attr_reader(:name, :phone)


  @@phone_book = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = []
    @phone.push(attributes.fetch(:phone))
  end

  # INSTANCE METHODS

  define_method(:add_phone) do |new_number|
    @phone.push(new_number)
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

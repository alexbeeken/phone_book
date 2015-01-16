class Contact
  attr_reader(:name, :phone, :id)

  @@phone_book = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = []
    @id = @@phone_book.length+1
  end

  # INSTANCE METHODS

  define_method(:add_phone) do |new_number|
    @phone.push(new_number)
  end

  define_method(:save) do

    insert_index = nil
    deleteme = nil

    @@phone_book.each() do |contact|
      if contact.name() == self.name()
        already_in = true
        insert_index = @@phone_book.index(contact)
        deleteme = contact
      end
    end

    if insert_index != nil
      @@phone_book.delete(deleteme)
      @@phone_book.insert(insert_index, self)
    else
      @@phone_book.push(self)
    end
  end

  define_method(:set_id) do |id|
    @id = id
  end

  define_method(:delete_phone_at_index) do |index|
    @phone.delete_at(index)
  end

  # CLASS METHODS

  define_singleton_method(:clear) do
    @@phone_book = []
  end

  define_singleton_method(:all) do
    @@phone_book
  end

  define_singleton_method(:delete_contact) do |contact|
    @@phone_book.delete(contact)
  end

  define_singleton_method(:find_contact_by_name) do |findme|
    @@phone_book.each() do |contact|
      if contact.name() == findme
        return contact
      end
    end
    return false
  end

  define_singleton_method(:find_contact_by_id) do |id|
    @@phone_book[(id - 1)]
  end

  define_singleton_method(:reassign_ids) do
    counter = 1
    @@phone_book.each() do |contact|
      contact.set_id(counter)
    end
  end
end

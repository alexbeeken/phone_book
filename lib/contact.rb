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

  define_singleton_method(:alphabetize) do
    placeholder = 0
    sorted = false
    length_of_phone_book = @@phone_book.length()
    until sorted == true
      sorted = true
      contact_counter = 1
    @@phone_book.each() do |contact|
      compare_counter = 0
      loop_times = length_of_phone_book - contact_counter
      loop_times.times() do
      puts("statement block: #{@@phone_book[contact_counter].name()[0]} out of order with #{contact.name()[0]}? #{(@@phone_book[contact_counter].name()[0]) > (contact.name()[0])}")
        if @@phone_book[contact_counter].name()[0] > contact.name()[0]
           #binding.pry
           compare = @@phone_book[compare_counter]
           index_of_contact = @@phone_book.index(contact)
           index_of_compare = @@phone_book.index(compare)
           puts("before contact index #{@@phone_book.index(contact)}")
           puts("before compare index #{@@phone_book.index(compare)}")
           @@phone_book.delete(contact)
           @@phone_book.insert(index_of_compare, contact)
           @@phone_book.delete(compare)
           @@phone_book.insert(index_of_contact, compare)
           puts("after contact index #{@@phone_book.index(contact)}")
           puts("after compare index #{@@phone_book.index(compare)}")
           puts("other info loop_times: #{loop_times}")
           puts("compare_counter: #{compare_counter}")
           compare_counter = compare_counter + 1
           sorted = false
         end
       end
       contact_counter = contact_counter + 1
     end
   end
 end





end

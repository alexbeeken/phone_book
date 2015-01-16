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
          switch_needed = false
        if (@@phone_book[contact_counter].name()[0] == contact.name()[0])
          word1 = @@phone_book[contact_counter].name()
          word2 = contact.name()

          if word1.length < word2.length
            loop_word_times = word1.length()
          else
            loop_word_times = word2.length()
          end

          loop_word_times.times() do |letter_counter|

            if (word1[letter_counter] == word2[letter_counter])

            elsif (word1[letter_counter] > word2[letter_counter])
              move1 = word1
              move2 = word2
            end
          end


        elsif (@@phone_book[contact_counter].name()[0] < contact.name()[0])
            move1 = @@phone_book[contact_counter]
            move2 = contact
        end

        if (switch_needed == true)
             index_of_contact = @@phone_book.index(move2)
             index_of_compare = @@phone_book.index(move1)
             @@phone_book.delete(move2)
             @@phone_book.insert(index_of_compare, move2)
             @@phone_book.delete(move1)
             @@phone_book.insert(index_of_contact, move1)
             compare_counter = compare_counter + 1
             sorted = false
         end

           compare_counter = compare_counter + 1

         end

       end
       contact_counter = contact_counter + 1
     end
   end
 end

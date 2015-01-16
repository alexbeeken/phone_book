require('rspec')
require('contact')
require('phone')
require('pry')

describe("Contact") do
  before do
    Contact.clear()
  end

# INSTANCE METHODS

  describe("#save") do
    it('saves contact into phone book') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe("#phone") do
    it('displays the current contacts phone number') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar"})
      test_contact.add_phone(test_phone)
      test_contact.save()
      expect(test_contact.phone()).to(eq([test_phone]))
    end

    it('saves and displays more than one phone') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_phone2 = Phone.new({:number => "555-555-5556", :type => "home", :carrier => "ATT"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.add_phone(test_phone)
      test_contact.add_phone(test_phone2)
      test_contact.save()
      expect(test_contact.phone()).to(eq([test_phone, test_phone2]))
    end
  end

  describe("#contact_name") do
    it('displays the current contacts name') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      expect(test_contact.name()).to(eq("Foo Bar"))
    end
  end

  describe("#delete_phone_at_index") do
    it('deletes the phone at that index in a contact') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.delete_phone_at_index(0)
      expect(test_contact.phone()).to(eq([]))
    end
  end


# CLASS METHODS

  describe(".all") do
    it('lists out all contacts in an array') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".save") do

    it('saves contacts into the phone book') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end

    it('updates contacts in the phone book if name already exists') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      test_phone = Phone.new({:number => "555-555-5557", :type => "work", :carrier => "T-Mobile"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".delete_contact") do
    it('removes given contact from phone book') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "555-555-5557", :type => "work", :carrier => "T-Mobile"})
      test_contact2 = Contact.new({:name => "Foo Bar Jr", :phone => test_phone2})
      test_contact2.save()
      Contact.delete_contact(test_contact)
      expect(Contact.all()).to(eq([test_contact2]))
    end
  end

  describe(".find_contact_by_name") do
    it("returns contact object for given name") do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "555-555-5557", :type => "work", :carrier => "T-Mobile"})
      test_contact2 = Contact.new({:name => "Foo Bar Jr", :phone => test_phone2})
      test_contact2.save()
      expect(Contact.find_contact_by_name('Foo Bar Jr')).to(eq(test_contact2))
    end
  end

  describe(".alphabetize") do
    it("alphabetizes the phone book by name with one letter names, two names") do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "z", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "555-555-5557", :type => "work", :carrier => "T-Mobile"})
      test_contact2 = Contact.new({:name => "a", :phone => test_phone2})
      test_contact2.save()
      Contact.alphabetize()
      expect(Contact.all()).to(eq([test_contact2, test_contact]))
    end

    it("alphabetizes the phone book by name with two letter names, two names") do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "zz", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "555-555-5557", :type => "work", :carrier => "T-Mobile"})
      test_contact2 = Contact.new({:name => "aa", :phone => test_phone2})
      test_contact2.save()
      Contact.alphabetize()
      expect(Contact.all()).to(eq([test_contact2, test_contact]))
    end

    it("alphabetizes the phone book by name with more complex names") do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Zanahoria", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "555-555-5557", :type => "work", :carrier => "T-Mobile"})
      test_contact2 = Contact.new({:name => "Naranja", :phone => test_phone2})
      test_contact2.save()
      Contact.alphabetize()
      expect(Contact.all()).to(eq([test_contact2, test_contact]))
    end

    it("alphabetizes by the rest of the letters in names") do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "zb", :phone => test_phone})
      test_contact.save()
      test_phone2 = Phone.new({:number => "555-555-5557", :type => "work", :carrier => "T-Mobile"})
      test_contact2 = Contact.new({:name => "za", :phone => test_phone2})
      test_contact2.save()
      Contact.alphabetize()
      expect(Contact.all()).to(eq([test_contact2, test_contact]))
    end
  end



end

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
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      expect(test_contact.phone()).to(eq([test_phone]))
    end

    it('saves and displays more than one phone') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_phone2 = Phone.new({:number => "555-555-5556", :type => "home", :carrier => "ATT"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
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


# CLASS METHODS

  describe(".all") do
    it('lists out all contacts in an array') do
      test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
      test_contact = Contact.new({:name => "Foo Bar", :phone => test_phone})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end
end

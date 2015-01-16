require('rspec')
require('contact')
require('pry')

describe("Contact") do
  before do
    Contact.clear()
  end

# INSTANCE METHODS

# CLASS METHODS

  describe(".all") do
    it('lists out all contacts in an array') do
      test_contact = Contact.new({:contact => "Foo Bar", :phone => "555-555-5555"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end
end

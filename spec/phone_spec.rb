require('rspec')
require('contact')
require('phone')
require('pry')

describe('#number') do
  it('returns the number of the phone') do
    test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
    expect(test_phone.number()).to(eq("555-555-5555"))
  end
end

describe('#type') do
  it('returns the type of number') do
    test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
    expect(test_phone.type()).to(eq("work"))
  end
end

describe('#carrier') do
  it('returns the phone carrier') do
    test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
    expect(test_phone.carrier()).to(eq("Verizon"))
  end
end

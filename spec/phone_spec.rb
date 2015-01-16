require('rspec')
require('contact')
require('phone')
require('pry')

describe('#number') do
  it('returns the number of the phone') do
    test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
    expect(test_phone.number()).to(eq("555-555-5555"))
  end

  it('returns nil when no number saved') do
    test_phone = Phone.new({:type => "work", :carrier => "Verizon"})
    expect(test_phone.number()).to(eq(nil))
  end
end

describe('#type') do
  it('returns the type of number') do
    test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
    expect(test_phone.type()).to(eq("work"))
  end

  it('returns nil when no type is entered') do
    test_phone = Phone.new({:number => "555-555-5555", :carrier => "Verizon"})
    expect(test_phone.type()).to(eq(nil))
end

describe('#carrier') do
  it('returns the phone carrier') do
    test_phone = Phone.new({:number => "555-555-5555", :type => "work", :carrier => "Verizon"})
    expect(test_phone.carrier()).to(eq("Verizon"))
  end

  it('returns nil when no carrier is entered') do
    test_phone = Phone.new({:number => "555-555-5555", :type => "work"})
    expect(test_phone.carrier()).to(eq(nil))
  end
end
end

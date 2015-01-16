class Phone
  attr_reader(:number, :type, :carrier)

  define_method(:initialize) do |attributes|
    @number = attributes[:number]
    @type = attributes[:type]
    @carrier = attributes[:carrier]
  end
end

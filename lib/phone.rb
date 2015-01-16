class Phone
  attr_reader(:number, :type, :carrier)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
    @carrier = attributes.fetch(:carrier)
  end
end

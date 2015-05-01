class Definition
  attr_reader(:type, :definition)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @definition = attributes.fetch(:definition)
  end
end

class Definition
  attr_reader(:type, :definition)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @definition = attributes.fetch(:definition)
  end

  define_singleton_method(:all) do
    @@definitions
  end
end

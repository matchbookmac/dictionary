class Definition
  attr_reader(:type, :definition)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @definition = attributes.fetch(:definition)
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:all) do
    @@definitions
  end
end

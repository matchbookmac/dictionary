class Definition
  attr_reader(:type, :definition, :id)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @definition = attributes.fetch(:definition)
    @id = @@definitions.length().+(1)
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

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@definitions.each() do |definition|
      if(definition.id().eql?(id))
        found_definition = definition
      end
    end
    found_definition
  end
end

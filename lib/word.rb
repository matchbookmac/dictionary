class Word
  attr_reader(:spelling)
  @@words = []

  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end
end

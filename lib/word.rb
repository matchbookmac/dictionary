class Word
  attr_reader(:spelling)
  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
  end
end

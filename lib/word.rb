class Word
  attr_reader(:spelling, :id, :define)
  @@words = []

  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
    @id = @@words.length().+(1)
    @define = []
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

  define_singleton_method(:find) do |id|
    found_word = nil
      @@words.each() do |word|
        if(word.id().eql?(id))
          found_word = word
        end
      end
    found_word
  end

  define_method(:add_definition) do |definition|
    @define.push(definition)
  end
end

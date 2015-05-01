require('rspec')
require('definition')
require('word')

describe(Word) do
  describe('#spelling') do
    it('returns the spelling of the word') do
      test_word = Word.new({:spelling => 'Ruby'})
      expect(test_word.spelling()).to(eq('Ruby'))
    end
  end

  # describe('#define') do
  #   it('returns the definition of a word') do
  #     test_definition = Definition.new({:type => 'noun', :definition => 'A programming language.'})
  #     test_word = Word.new({:spelling => 'Ruby'})
  #     test_word.add_definition(test_definition)
  #     expect(test_word.define()).to(eq(test_definition))
  #   end
  # end
end

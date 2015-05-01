require('rspec')
require('definition')

describe(Definition) do
  describe('#definition') do
    it('returns the definition of the definition object') do
      test_definition = Definition.new({:type => 'noun', :definition => 'A programming language.'})
      expect(test_definition.definition()).to(eq('A programming language.'))
    end
  end

  describe('#type') do
    it('returns the definition of the definition object') do
      test_definition = Definition.new({:type => 'noun', :definition => 'A programming language.'})
      expect(test_definition.type()).to(eq('noun'))
    end
  end

  describe('.all') do
    it('returns an empty array of definitions') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('clears the array of definitions') do
      test_definition = Definition.new({:type => 'noun', :definition => 'A programming language.'})
      test_definition.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
end

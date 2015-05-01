require('rspec')
require('definition')

describe(Definition) do

  before() do
    Definition.clear()
  end

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

  describe('#save') do
    it('saves a definition to the array of definitions') do
      test_definition = Definition.new({:type => 'noun', :definition => 'A programming language.'})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
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

  describe('#id') do
    it('returns the id of a given definition') do
      test_definition = Definition.new({:type => 'noun', :definition => 'A programming language.'})
      test_definition.save()
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe('#find') do
    it('returns a definition given its id') do
      test_definition = Definition.new({:type => 'noun', :definition => 'A programming language.'})
      test_definition.save()
      test_definition_2 = Definition.new({:type => 'verb', :definition => 'To program.'})
      test_definition_2.save()
      expect(Definition.find(2)).to(eq(test_definition_2))
    end
  end
end

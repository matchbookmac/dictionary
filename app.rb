require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/dictionary/add') do
  erb(:word_form)
end

post('/dictionary/add') do
  spelling = params.fetch('word')
  type = params.fetch('type')
  definition = params.fetch('definition')
  @definition = Definition.new({:type => type, :definition => definition})
  @word = Word.new({:spelling => spelling})
  already_exists = false
  @existing_word = nil
  @words = Word.all()
  @words.each() do |word|
    if(word.spelling().eql?(@word.spelling()))
      already_exists = true
      @existing_word = word
    end
  end
  if(already_exists.eql?(false))
    @word.save()
    @word.add_definition(@definition)
  end
  erb(:word_success)
end

get('/dictionary/:id/:word') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/dictionary/:id/:word/add') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition_form)
end

post('/dictionary/:id/:word/add') do
  @word = Word.find(params.fetch('id').to_i())
  type = params.fetch('type')
  definition = params.fetch('definition')
  @definition = Definition.new({:type => type, :definition => definition})
  @word.add_definition(@definition)
  erb(:word_success)
end

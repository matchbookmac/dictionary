require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
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
  @definition.save()
  @word = Word.new({:spelling => spelling})
  @word.save()
  @word.add_definition(@definition)
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
  @definition.save()
  @word.add_definition(@definition)
  erb(:word_success)
end

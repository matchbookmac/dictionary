require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @words = []
  erb(:index)
end

get('/dictionary/add') do
  erb(:word_form)
end

post('dictionary/add') do
  spelling = params.fetch('word')
  type = params.fetch('type')
  definition = params.fetch('definition')
  definition.save()
  @word = Word.new({:spelling => spelling})
  @word.save()
  @word.add_definition(definition)
  erb(:word_success)
end

require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')
# also_reload('public/main.css')

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
  @word.add_definition(definition)
  erb(:word_success)
end

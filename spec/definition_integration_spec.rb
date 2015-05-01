require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dictionary path', {:type => :feature}) do
  it('will show the user the homepage') do
    visit('/')
    expect(page).to have_content('My Personal Dictionary')
  end

  it('will let the user add a word and navigate home') do
    visit('/')
    click_link('Add Word')
    fill_in('word', :with => 'Ruby')
    find('type').find(:xpath, 'option[0]').select_option
    fill_in('definition', :with => 'An elegant and versatile programming language')
    click_button('Add')
    expect(page).to have_content('Your word: Ruby has been added to the dictionary')
    click_link('Home')
    expect(page).to have_content('My Personal Dictionary')
    expect(page).to have_content('Ruby')
  end

  # it('will let the user add a word and then adding another definition to the word') do
  #   visit('/')
  #   click_button('Add Word')
  #   fill_in('word', :with => 'Ruby')
  #   fill_in('type', :with => 'Noun')
  #   fill_in('definition', :with => 'An elegant and versatile programming language')
  #   click_button('Add')
  #   expect(page).to have_content('Your word: Ruby has been added to the dictionary')
  #   click_button('Home')
  #   expect(page).to have_content('My Personal Dictionary')
  #   expect(page).to have_content('Ruby')
  # end

end

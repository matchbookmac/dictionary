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
    fill_in('word', :with => 'HTML')
    find('#type').find(:xpath, 'option[1]').select_option
    fill_in('definition', :with => 'What the web is written in')
    click_button('Add')
    expect(page).to have_content('Your word: HTML has been added to the dictionary')
    click_link('Home')
    expect(page).to have_content('My Personal Dictionary')
    expect(page).to have_content('HTML')
  end

  it('will let the user add a word and then adding another definition to the word') do
    visit('/')
    click_link('Add Word')
    fill_in('word', :with => 'Ruby')
    find('#type').find(:xpath, 'option[2]').select_option
    fill_in('definition', :with => 'An elegant and versatile programming language')
    click_button('Add')
    expect(page).to have_content('Your word: Ruby has been added to the dictionary')
    click_link('Add Another Definition to this Word')
    expect(page).to have_content('Please add another definition to the word Ruby below')
    find('#type').find(:xpath, 'option[2]').select_option
    fill_in('definition', :with => 'A language written by Yukihiro Matsumoto')
    click_button('Add')
    expect(page).to have_content('Your word: Ruby has been updated')
    click_link('Home')
    expect(page).to have_content('My Personal Dictionary')
    expect(page).to have_content('Ruby')
  end

  it('will let the user view a word and its definitions and navigate home') do
    visit('/')
    click_link('Add Word')
    fill_in('word', :with => 'Java')
    find('#type').find(:xpath, 'option[2]').select_option
    fill_in('definition', :with => 'A language built for the web')
    click_button('Add')
    expect(page).to have_content('Your word: Java has been added to the dictionary')
    click_link('Home')
    click_link('Java')
    expect(page).to have_content('Java')
    expect(page).to have_content('Noun')
    expect(page).to have_content('A language built for the web')
    click_link('Home')
    expect(page).to have_content('My Personal Dictionary')
    expect(page).to have_content('Java')
  end

  it('will let the user add a word and then view the word home') do
    visit('/')
    click_link('Add Word')
    fill_in('word', :with => 'PHP')
    find('#type').find(:xpath, 'option[1]').select_option
    fill_in('definition', :with => 'An oldie but goodie.')
    click_button('Add')
    expect(page).to have_content('Your word: PHP has been added to the dictionary')
    click_link('View This Word')
    expect(page).to have_content('My Personal Dictionary')
    expect(page).to have_content('PHP')
    expect(page).to have_content('An oldie but goodie.')
  end

  it('will not let the user add a word that has already been added') do
    visit('/')
    click_link('Add Word')
    fill_in('word', :with => 'Smalltalk')
    find('#type').find(:xpath, 'option[2]').select_option
    fill_in('definition', :with => 'An old-school OO language')
    click_button('Add')
    expect(page).to have_content('Your word: Smalltalk has been added to the dictionary')
    click_link('Home')
    click_link('Add Word')
    fill_in('word', :with => 'Smalltalk')
    find('#type').find(:xpath, 'option[2]').select_option
    fill_in('definition', :with => 'An old-school OO language')
    click_button('Add')
    expect(page).to have_content('Your word: Smalltalk has already been added to the dictionary, please add a different word.')
    click_link('Home')
    click_link('Smalltalk')
    expect(page).to have_content('Smalltalk')
    expect(page).to have_content('Noun')
    expect(page).to have_content('An old-school OO language')
    click_link('Home')
    expect(page).to have_content('My Personal Dictionary')
    expect(page).to have_content('Smalltalk')
  end
end

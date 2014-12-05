require 'spec_helper'
require 'helpers/session_helper_spec'

describe 'FEATURE manage users', js: true do

  it 'allows deleting of a user' do
    FactoryGirl.create(:user)

    login
    click_link('Users')
    click_link('Delete')

    expect(page).not_to have_content(:text => "Factory Girl Created User")
  end
end

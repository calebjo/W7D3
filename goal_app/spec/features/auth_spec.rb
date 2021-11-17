# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    # before :each do
    #     create(:user)
    #     visit new_user_url
    # end
    

    scenario 'has a new user page' do
        visit new_user_url
        expect(page).to have_content 'NEW USER PAGE'
    end
    scenario 'shows username on the homepage after signup' do
        sign_up_as('hello')
        expect(page).to have_content "hello"
    end
end

feature 'logging in' do
    scenario 'shows username on the homepage after login' do
    end
end

feature 'logging out' do
    scenario 'begins with a logged out state' do
    end

    scenario 'doesn\'t show username on the homepage after logout' do
    end

end
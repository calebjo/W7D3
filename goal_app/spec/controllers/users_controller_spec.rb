require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET #index' do 
        it 'renders the users index page' do 
            get :index
            expect(response).to render_template(:index)
        end 
    end 

    describe 'GET #new' do 

        it 'renders the new page' do
            allow(subject).to receive(:ensure_logged_out).and_return(:true) 
            get :new
            expect(response).to render_template(:new)
        end 
    end 


    describe 'POST #create' do 
        before :each do
                create(:user)
                allow(subject).to receive(:current_user).and_return(User.last)
            end

            let(:valid_params) {{
                    user: {
                        username: 'testguy'
                    }}
            }

            let(:invalid_params) {{
                    user: {
                        nada: ''
                    }}
            }

            context 'with valid params' do
            it 'creates the user' do
                user :create, params: valid_params
                expect(User.last.username).to eq('testguy')
            end 

            it 'redirects to the user''s show page' do
                user :create, params: valid_params
                expect(response).to redirect_to(post_url(User.last.id))
            end 

            context 'with invalid params' do
                before :each do
                    user :create, params: invalid_params
                end

                it 'renders the new template' do
                    expect(response).to render_template(:new)
                end

                it 'adds errors to flash' do
                    expect(flash[:errors]).to be_present
                end
            end
        end
    end 

    describe 'DELETE #destroy' do
        let(:test_user) { create(:user) }

            before :each do
                delete :destroy, params: { id: test_user.id }
            end

            it 'destroys the user' do
                expect(User.exists?(test_user.id)).to be false
            end

            it 'redirects to user_url' do
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(users_url)
            end 
    end 


    describe 'GET #show' do 
        it "renders the user's page" do 
            get :show
            expect(response).to render_template(:show)
        end 
    end 

end 
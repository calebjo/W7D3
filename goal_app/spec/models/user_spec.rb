require 'rails_helper'

# test validations

RSpec.describe User, type: :model do
    subject(:user){
        User.create(
            username: 'hello',
            password: 'password'
        )
    }

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }

    it { should validate_length_of(:password).is_at_least(6) }

    describe 'uniqueness' do
        before :each do
            create(:user)
        end

        it { should validate_uniqueness_of(:username)}
        it { should validate_uniqueness_of(:session_token)}
    end

    describe 'is_password?' do 
        let(:user){create(:user)}
        context 'with a valid password' do 
            it 'should return true' do 
                expect(user.is_password?('password')).to be true 
            end 
        end 
        
        context 'with an invalid password' do 
            it 'should return false' do 
                expect(user.is_password?('passddfafdf')).to be false 
            end 
        end 
    end 

    describe "find_by_credentials" do 
        let(:user){create(:user)} 
        context 'with valid credentials' do 
            it 'should return user' do 
                expect(User.find_by_credentials(user.username, 'password')).to eq user 
            end 

        end 

        context 'with invalid credentials' do 
            it 'should return nil' do 
                expect(User.find_by_credentials('hello', 'password')).to be nil 
            end 
        end 

    end 

end


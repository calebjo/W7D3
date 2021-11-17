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
end
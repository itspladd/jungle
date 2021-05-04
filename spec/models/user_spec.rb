require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations:' do
    before(:each) do
      @params = {
        first_name: 'Tautrion',
        last_name: 'Stoneglutes',
        email: 'goddess-king@petalsworn.clan',
        email_confirmation: 'goddess-king@petalsworn.clan',
        password: 'flowerDeity96',
        password_confirmation: 'flowerDeity96'
      }
    end

    it 'should succeed when all parameters/confirmations are valid/present' do
      user = User.create @params
      expect(user).to be_valid
    end

    describe 'password' do
      it 'should require both password and password_confirmation' do
        user = User.create @params.except(:password_confirmation)
        expect(user.errors.full_messages)
          .to include "Password confirmation can't be blank"
        user = User.create @params.except(:password)
        expect(user.errors.full_messages)
          .to include "Password can't be blank"
      end
      it 'should require that password and password_confirmation match' do
        @params[:password] = 'banana'
        user = User.create @params
        expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end

    describe 'email' do
      it 'should require a unique email' do
        user1 = User.create @params
        user2 = User.create @params
        expect(user2.errors.full_messages).to include "Email has already been taken"
      end
      it 'should require both email and email_confirmation' do
        user = User.create @params.except(:email_confirmation)
        expect(user.errors.full_messages).to include "Email confirmation can't be blank"
        user = User.create @params.except(:email)
        expect(user.errors.full_messages).to include "Email confirmation doesn't match Email"
      end
      it 'should require that email and email_confirmation match' do
        @params[:email] = 'bloodwarrior@hemoclobberin.clan'
        user = User.create @params
        expect(user.errors.full_messages).to include "Email confirmation doesn't match Email"
      end
    end

    describe 'names' do
      it 'should require first_name' do
        user = User.create @params.except(:first_name)
        expect(user.errors.full_messages).to include "First name can't be blank"
      end
      it 'should require last_name' do
        user = User.create @params.except(:last_name)
        expect(user.errors.full_messages).to include "Last name can't be blank"
      end
    end
  end
end

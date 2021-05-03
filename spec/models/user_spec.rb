require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations:' do
    describe 'password' do
      it 'should require both password and password_confirmation' do
        user = User.create password: 'banana',
                            email: 'test@test.com',
                            email_confirmation: 'test@test.com'
        expect(user.errors.full_messages).to include "Password confirmation can't be blank"
        user = User.create password_confirmation: 'banana',
                            email: 'test@test.com',
                            email_confirmation: 'test@test.com'
        expect(user.errors.full_messages).to include "Password can't be blank"
      end

      it 'should require that password and password_confirmation match' do
        user = User.create  password: 'banana',
                            password_confirmation: 'ananab',
                            email: 'test@test.com',
                            email_confirmation: 'test@test.com'
        expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'succeeds when password and password_confirmation exist and match' do
        user = User.create  password: 'banana',
                            password_confirmation: 'banana',
                            email: 'test@test.com',
                            email_confirmation: 'test@test.com'
        expect(user).to be_valid
      end
    end

    describe 'email' do
      it 'should require a unique email' do
        user1 = User.create password: 'banana',
                            password_confirmation: 'banana',
                            email: 'test@test.com',
                            email_confirmation: 'test@test.com'
        user2 = User.create password: 'banana',
                            password_confirmation: 'banana',
                            email: 'test@test.com',
                            email_confirmation: 'test@test.com'
        expect(user2.errors.full_messages).to include "Email has already been taken"
      end

      it 'should require both email and email_confirmation' do
        user = User.create  password: 'banana',
                            password_confirmation: 'banana',
                            email: 'test@test.com'
        expect(user.errors.full_messages).to include "Email confirmation can't be blank"
        user = User.create  password: 'banana',
                            password_confirmation: 'banana',
                            email_confirmation: 'test@test.com'
        expect(user.errors.full_messages).to include "Email confirmation doesn't match Email"
      end

      it 'should require that email and email_confirmation match' do
        user = User.create  password: 'banana',
                            password_confirmation: 'banana',
                            email: 'test@test.com',
                            email_confirmation: 'example@example.com'
        expect(user.errors.full_messages).to include "Email confirmation doesn't match Email"
      end

      it 'succeeds when email and email_confirmation exist and match' do
        user = User.create  password: 'banana',
                            password_confirmation: 'banana',
                            email: 'test@test.com',
                            email_confirmation: 'test@test.com'
        expect(user).to be_valid
      end
    end
  end
end

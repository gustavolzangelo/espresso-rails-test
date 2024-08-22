# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'is valid user' do
    user = described_class.new(email: 'gustavolz.angelo@gmail.com', password: '123456', role: :admin)
    user.valid?
    expect(user).to be_valid
  end

  context 'when user is invalid' do
    it 'user missing email' do
      user = described_class.new(password: Faker::String.random, role: :admin)
      user.valid?
      expect(user.errors[:email]).to include(I18n.t('activerecord.errors.models.user.attributes.email.blank'))
    end

    it 'user invalid email' do
      user = described_class.new(email: Faker::Internet.username, password: Faker::String.random, role: :admin)
      user.valid?
      expect(user.errors[:email]).to include(I18n.t('activerecord.errors.models.user.attributes.email.invalid'))
    end

    it 'user missing password' do
      user = described_class.new(email: Faker::Internet.email)
      user.valid?
      expect(user.errors[:password]).to include(I18n.t('activerecord.errors.models.user.attributes.password.blank'))
    end

    it 'user missing role' do
      user = described_class.new(email: Faker::Internet.email, password: Faker::String.random)
      user.valid?
      expect(user.errors[:role]).to include(I18n.t('activerecord.errors.models.user.attributes.role.blank'))
    end

    it 'user invalid role' do
      user = described_class.new(email: Faker::Internet.email, password: Faker::String.random, role: :invalid)
      user.valid?
      puts "user.errors[:role]: #{user.errors[:role]}"
      expect(user.errors[:role]).to include(I18n.t('activerecord.errors.models.user.attributes.role.inclusion'))
    end
  end
end

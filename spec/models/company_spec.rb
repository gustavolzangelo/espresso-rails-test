# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company do
  context 'when cnpj is invalid' do
    it 'is invalid without a cnpj' do
      company = described_class.new(name: Faker::Company.name)
      company.valid?
      expect(company.errors[:cnpj]).to include(I18n.t('activerecord.errors.models.company.attributes.cnpj.blank'))
    end

    it 'is invalid with a cnpj with more than 14 digits' do
      company = described_class.new(name: Faker::Company.name, cnpj: Faker::String.random(length: 15))
      company.valid?
      expect(company.errors[:cnpj]).to include(I18n.t('activerecord.errors.models.company.attributes.cnpj.invalid'))
    end

    it 'is invalid with a cnpj with less than 14 digits' do
      company = described_class.new(name: 'Company', cnpj: Faker::String.random(length: 5))
      company.valid?
      expect(company.errors[:cnpj]).to include(I18n.t('activerecord.errors.models.company.attributes.cnpj.invalid'))
    end
  end

  context 'when namei is invalid' do
    it 'is invalid without a name' do
      company = described_class.new(cnpj: Faker::String.random(length: 14))
      company.valid?
      expect(company.errors[:name]).to include(I18n.t('activerecord.errors.models.company.attributes.name.blank'))
    end
  end
end

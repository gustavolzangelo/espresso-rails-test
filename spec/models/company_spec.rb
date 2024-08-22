# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company do
  context 'validations' do
    context 'cnpj' do
      it 'is invalid without a cnpj' do
        company = described_class.new(name: '12345678000195')
        company.valid?
        expect(company.errors[:cnpj]).to include(I18n.t('activerecord.errors.models.company.attributes.cnpj.blank'))
      end

      it 'is invalid with a cnpj with more than 14 digits' do
        company = described_class.new(name: 'Company', cnpj: '1234567800019')
        company.valid?
        expect(company.errors[:cnpj]).to include(I18n.t('activerecord.errors.models.company.attributes.cnpj.invalid'))
      end

      it 'is invalid with a cnpj with less than 14 digits' do
        company = described_class.new(name: 'Company', cnpj: '123456780001')
        company.valid?
        expect(company.errors[:cnpj]).to include(I18n.t('activerecord.errors.models.company.attributes.cnpj.invalid'))
      end
    end

    context 'name' do
      it 'is invalid without a name' do
        company = described_class.new(cnpj: '12345678000195')
        company.valid?
        expect(company.errors[:name]).to include(I18n.t('activerecord.errors.models.company.attributes.name.blank'))
      end
    end
  end
end

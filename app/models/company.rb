# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name , presence: true
  validate :cnpj_must_be_valid

  private

  def cnpj_must_be_valid
    errors.add(:cnpj, :blank) if cnpj.blank?
    errors.add(:cnpj, :invalid) if cnpj.present? and !cnpj.match?(/\A\d{14}\z/)
  end
end

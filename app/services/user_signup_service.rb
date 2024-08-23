# frozen_string_literal: true

class UserSignupService < ApplicationService
  def initialize(user_params)
    @user_params = user_params
  end

  def call
    company = find_or_create_company
    create_user(company)
  end

  def find_or_create_company
    Company.find_or_create_by(name: @user_params[:company_name], cnpj: @user_params[:cnpj])
  end

  def create_user(company)
    user = User.new(@user_params.except(:company_name, :cnpj).merge(company: company, role: :admin))
    if user.save
      { success: true, user: user }
    else
      Rails.logger.error(user.errors.full_messages)
      { success: false, errors: user.errors.full_messages }
    end
  end
end

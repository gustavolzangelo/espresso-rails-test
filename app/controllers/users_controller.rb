# frozen_string_literal: true

class UsersController < ApplicationController
  include Devise::Controllers::Helpers
  def new; end

  def create
    result = UserSignupService.call(user_params)

    if result[:success]
      sign_in(result[:user])
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :company_name, :cnpj)
  end
end

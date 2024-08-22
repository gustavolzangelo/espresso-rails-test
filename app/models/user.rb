# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum roles: { employee: 'employee', admin: 'admin' }

  validates :role, presence: true, inclusion: { in: roles.keys }

  def admin?
    roles == 'admin'
  end
end

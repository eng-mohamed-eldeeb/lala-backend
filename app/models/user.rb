class User < ApplicationRecord
  # this fuked me up
  # attr_accessor :name, :img_url, :is_admin

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

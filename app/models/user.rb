class User < ActiveRecord::Base
    has_many :comments
    has_many :boxes, through: :comments
  end
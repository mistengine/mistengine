class User < ActiveRecord::Base
  has_many :authors
  has_many :articles, through: :authors

  default_scope { where(active: true) }
end

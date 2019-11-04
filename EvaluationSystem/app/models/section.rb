class Section < ApplicationRecord
  has_many :surveys, dependent: :destroy
end

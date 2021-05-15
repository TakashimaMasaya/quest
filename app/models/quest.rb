class Quest < ApplicationRecord
  validates :title, presence: true

  has_many :answers, dependent: :destroy
  belongs_to :user

end

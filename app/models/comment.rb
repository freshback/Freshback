class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :keshback
  validates :text, presence: :true
end

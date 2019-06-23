class Keshback < ApplicationRecord
  belongs_to :user,       optional: true

  has_many :comments,     dependent: :destroy

  validates :name,        presence: true
  validates :count,       presence: true
  validates :link,        presence: true
  validates :description, presence: true
  mount_uploader :photo,  PhotoUploader

end

class Keshback < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :name,        presence: :true
  validates :description, presence: :true
  validates :link,        presence: :true
  validates :count,       presence: :true
  validates :photo,       presence: :true

  #serialize :photo, JSON
end

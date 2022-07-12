class Repertory < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :musics

  validates :name, presence: true
end

class Music < ApplicationRecord
  has_and_belongs_to_many :repertories

  validates :name, presence: true
  validates :author, presence: true

  def name_and_author
    "#{name} - #{author}"
  end
end

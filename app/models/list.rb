class List < ActiveRecord::Base
  has_many :items
  belongs_to :user

  validates :name, presence: true
  validates :permissions, presence: true
  validates :user_id, presence: true
  validates :permissions, inclusion: { in: %w(private viewable open)}
end

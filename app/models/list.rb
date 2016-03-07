class List < ActiveRecord::Base

  validates :name, presence: true
  validates :permissions, presence: true
  validates :permissions, inclusion: { in: %w(private viewable open)}
end

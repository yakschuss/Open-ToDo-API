class List < ActiveRecord::Base

  validates :name, presence: true
  validates :permissions, presence: true
end

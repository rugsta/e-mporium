class Category < ActiveRecord::Base
  validates :category_name, presence: true

  #category has no reference to a task and hence uses has_many
  has_many :tasks
end

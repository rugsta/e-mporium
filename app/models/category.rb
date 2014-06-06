class Category < ActiveRecord::Base
  validates_presence_of :category_name

  #category has no reference to a task and hence uses has_many
  has_many :tasks
end

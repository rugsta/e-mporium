class Task < ActiveRecord::Base
  validates :category_id, presence: true
  #validates :title, :note, presence: true

  #so when a model/table has an id that's referencing another model/table then use belongs_to
  belongs_to :category
end

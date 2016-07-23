class Purchase < ActiveRecord::Base
  belongs_to :crown
  belongs_to :buyer, class_name: 'User'
end

class Post < ApplicationRecord
belongs_to :city

validates :title, presence: true
validates :text, presence: true
end
 
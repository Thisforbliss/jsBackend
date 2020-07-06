class Post < ApplicationRecord
    has_many :comments
    validates :title, uniqueness: true
    validates :content, uniqueness: true
end

class Comment < ApplicationRecord
    belongs_to :post
    validates :content, uniqueness: true

end

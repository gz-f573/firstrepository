class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  
  validate :content, presence: true, length: {minimum: 5, maximimum: 1000 }
end

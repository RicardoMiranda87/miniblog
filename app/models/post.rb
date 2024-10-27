class Post < ApplicationRecord
  belongs_to :user
  
  class Post < ApplicationRecord
    has_one_attached :image
  end
end

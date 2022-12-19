class Post < ApplicationRecord
  acts_as_paranoid

  def self.search(keyword)
    if keyword
      Post.where("title like ?", "%#{keyword}%")
    else
      Post.all
    end
  end
end

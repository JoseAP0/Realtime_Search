class Article < ApplicationRecord

  def self.title_search(query)
    self.where('title LIKE ?', "%#{query}%")
  end
end

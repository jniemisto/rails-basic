class Book < ActiveRecord::Base
  
  has_many :reservations
  has_many :ratings
  
  validates :title, :presence => true, :uniqueness => true
  validates :authors, :presence => true

  validates_with IsbnValidator
  
  def reserved
    self.reservations.where(state: 'reserved').first
  end
  
  def self.search_by_isbn(value)
    self.where(:isbn => value)
  end
  
  def self.search_by_authors(value)
    self.where("authors LIKE ?", "%#{value}%").order("authors asc, created_at desc")
  end
  
  def self.search_by_title(value)
    self.where("title LIKE ?", "%#{value}%").order("title asc, created_at desc")
  end
  
  def rated_by?(user)
    return true if ratings.where(user_id: user.id).count > 0
    return false
  end
  
end

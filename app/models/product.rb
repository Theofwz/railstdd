class Product < ActiveRecord::Base

  validates :title, :description, presence: true
  validate :price_more_than_0
  validate :title_is_shorter_than_description
  validate :title_is_lowercase

  def price_more_than_0
    return  if price.blank?
    validates_numericality_of :price, greater_than: 0
  end

  def title_is_shorter_than_description
    return if title.blank? or description.blank?
    if title.length > description.length
      errors.add(:title, "title is shorter than description")
    end
  end

  def title_is_lowercase
    return if title.blank?
    self.title = self.title.downcase
  end
end
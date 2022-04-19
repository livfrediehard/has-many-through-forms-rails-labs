class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :user

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attributes|
      if category_attributes["name"].preset?
        category = Category.find_or_create_by(category_attributes)
        self.categories << category
      end
    end
  end


end

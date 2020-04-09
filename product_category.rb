class ProductCategory < ApplicationRecord
  has_many :products
  validates :title, :sorting, presence: true

  def self.category
    product_array = []
    ProductCategory.all.each do |c|
      total = Product.joins(:product_category).where('product_categories.title = ?', c.title).count
      product_array.push [c.title, total]
    end
    product_array
  end
end

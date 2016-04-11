class Article < ActiveRecord::Base
  validates :title, :contact, :price, :category_id, presence: true
  belongs_to :category

  def generate_hash
    self.hash_key = SecureRandom.hex(n=3)
  end



end

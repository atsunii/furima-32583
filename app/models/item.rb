class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :state
  belongs_to :deliveryfee
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { greater_than: 299, less_than: 9_999_999 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :deliveryfee_id
      validates :prefecture_id
      validates :day_id
    end
  end
end

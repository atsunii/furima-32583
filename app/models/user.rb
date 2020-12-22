class User < ApplicationRecord
  has_many :Purchases
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :kanji_last_name
    validates :kanji_first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :katakana_last_name
    validates :katakana_first_name
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

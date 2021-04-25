class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
    validates :first_name
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
    validates :birth_date
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  has_many :items
end

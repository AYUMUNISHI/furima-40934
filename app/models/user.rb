class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname, presence: true 
 validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
 validates :last_name, presence: true 
 validates :first_name, presence: true 
 validates :last_name_kana, presence: true, format: { with: /\A[\p{hiragana}\p{katakana}ー－]+\z/, message: "はカナ文字のみ使用できます" } 
 validates :first_name_kana, presence: true, format: { with: /\A[\p{hiragana}\p{katakana}ー－]+\z/, message: "はカナ文字のみ使用できます" }
 validates :birthday, presence: true 

end
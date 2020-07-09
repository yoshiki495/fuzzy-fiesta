class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: {minimum:2, maximum: 20}

  has_many :books, :dependent => :destroy
  attachment :profile_image

  def books
	return Book.where(user_id: self.id)
  end

end

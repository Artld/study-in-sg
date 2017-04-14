class User < ActiveRecord::Base
  attr_accessible :birthday, :created_at, :email, :first_name, :id, :last_name, :password, :updated_at, :username
  has_many :posts
  has_many :images, :as => :imageable

  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 8 }

  scope :old, -> { where("birthday <= ?", 18.years.ago ) }

  def fullname
    "#{first_name} #{last_name}"
  end
end

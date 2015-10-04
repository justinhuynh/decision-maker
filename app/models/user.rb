class User < ActiveRecord::Base
  has_many :instances
  has_many :questions, through: :instances
  has_many :instance_choices, through: :instances
  has_many :choices, through: :instance_choices

  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :queries

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true
  validates :email, uniqueness: true

  def search(input)
    results = queries.joins(:question).
      where("questions.body ILIKE ?", "%#{input}%")
  end
end

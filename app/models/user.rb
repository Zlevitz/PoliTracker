class User < ActiveRecord::Base
  # Role set up and defaulting for basic sign up
  enum role: [:admin, :voter, :politician]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
  	self.role ||= :voter
  end

  validates :name, presence: true

  #has_many :pins, dependent: :destroy

  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

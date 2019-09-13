class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :accepted_sent_requests, -> { where accepted: 1 }, foreign_key: :requester_id, class_name: 'Request'
  has_many :friends, through: :accepted_sent_requests, source: :requestee

  has_many :sent_requests, foreign_key: :requester_id, class_name: 'Request', dependent: :destroy
  has_many :received_requests, foreign_key: :requestee_id, class_name: 'Request', dependent: :destroy
  has_many :requestees, through: :sent_requests, dependent: :destroy
  has_many :requesters, through: :received_requests, dependent: :destroy

  after_create :make_profile

  def make_profile
  	self.create_profile.save
  end
end

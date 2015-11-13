class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :events, dependent: :destroy

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverted_friendships, :class_name => "Friendship", :foreign_key => :friend_id
  has_many :inverted_friends, :through => :inverted_friendships, :source => :user 
  validates_uniqueness_of :username, :message => '%{value} has already been taken'

  has_attached_file :avatar, :styles => { :crop => "120x120#" }, default_url: ->(attachment) { ActionController::Base.helpers.asset_path('missingpic.png') }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
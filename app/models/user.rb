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

end

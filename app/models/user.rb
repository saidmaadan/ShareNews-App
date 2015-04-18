class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :authorizations, :dependent => :destroy
  # has_many :shares, foreign_key: 'from_user_id'

  def self.find_by_name_or_email(name)
    ## Find by name or email (place to optimize)
    find_by_name(name) || find_by_email(name)
  end
end

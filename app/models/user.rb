class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  belongs_to :organization
  has_one :f_fdevice
  has_many :media
  has_many :tokens

  # cloudinary
  mount_uploader :avatar, AvatarUploader
end

class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  validates :email, format: {
              with: /.+@.+\..+/,  message: 'Invalid email address.'
            }
  has_many :links
  has_many :comments
end

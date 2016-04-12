class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  validates :email, format: {
              with: /.+@.+\..+/,  message: 'Must have an @ symbol and a period.'
            }
  has_many :links
  has_many :comments
end

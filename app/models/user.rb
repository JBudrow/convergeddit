class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  validates :email, format: {
              with: /.+@.+\..+/,  message: 'Invalid email address.'
            }
  has_many :links
  has_many :comments
  has_many :votes
  has_many :voted_posts, through :votes, source: :link 
end

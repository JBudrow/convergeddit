class Vote < ActiveRecord::Base
  validates_presence_of :user_id, :url_id, :score
  validates :user_id, uniqueness: {
             scope: :url_id,
             message: 'one vote per link'
          }
  belongs_to :user
  belongs_to :post
end

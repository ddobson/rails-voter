class Vote < ActiveRecord::Base
  validates :voteable, :presence => true
  validates :user, :presence => true

  belongs_to :user
  belongs_to :post
  belongs_to :comment
end

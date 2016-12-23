class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes
  has_many :liked_users, :through => :likes, :source => "user"

  has_many :subscriptions
  has_many :subscribed_users, :through => :subscriptions, :source => "user"

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }

  def self.within_days(number_of_days)
    where( ["created_at >= ?", Time.now - number_of_days.days ] )
  end

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments

  has_many :likes
  has_many :liked_messages, :through => :likes, :source => "message"

  has_many :subscriptions
  has_many :subscribed_messages, :through => :subscriptions, :source => "message"

  def display_name
    self.email.split("@").first
  end

  def posts_count
    # TODO: 請完成我
    self.messages.size + self.comments.size
  end

  def words_count
    count = 0
    self.messages.find_each do |x|
      count += x.title.split(" ").size if x.title
      count += x.content.split(" ").size if x.content
    end

    self.comments.find_each do |x|
      count += x.content.split(" ").size if x.content
    end

    return count
  end

  def short_name
    self.email.split('@').first
  end
end

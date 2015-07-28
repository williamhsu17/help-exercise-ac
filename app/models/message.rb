class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end

require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.create!( :email => "foobar@example.org", :password => "12345678")
  end

  describe "#words_count" do
    before do
      # TODO: 加 Message 和 Comment 測試資料
    end

    it "加總該使用者的所有文章和留言的總字數" do
      # TODO: 測試 words_count 方法

    end
  end

end

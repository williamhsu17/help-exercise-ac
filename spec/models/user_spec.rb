require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.create!( :email => "foobar@example.org", :password => "12345678")
  end

  describe "#posts_count" do
    before do
      other_user = User.create!( :email => "ooxx@example.org", :password => "12345678")
      m1 = Message.create!( :user => other_user )
      Comment.create!( :user => other_user, :message => m1 )

      m2 = Message.create!( :user => @user )
      Comment.create!( :user => @user, :message => m2 )
      Comment.create!( :user => @user, :message => m2 )
    end

    it "回傳該使用者的總 Mesasge 數量加 Comment 數量" do
      expect( @user.posts_count ).to eq(3)
    end
  end

  describe "#words_count" do
    before do
      # TODO: 加 Message 和 Comment 測試資料
      other_user = User.create!( :email => "ooxx@example.org", :password => "12345678")
      m1 = Message.create!( :user => other_user, :title => "1234", :content => "12 34")
      Comment.create!( :user => other_user, :message => m1, :content => "12 34 56")

      m2 = Message.create!( :user => @user, :title => "1234", :content => "1234")
      Comment.create!( :user => @user, :message => m2, :content => "123 456")
      Comment.create!( :user => @user, :message => m2, :content => "12 34 56")
    end

    it "加總該使用者的所有 Mesasge 和 Comment 的總字數" do
      # TODO: 測試 words_count 方法
      other_user = User.find_by_email("ooxx@example.org")
      expect( other_user.words_count ).to eq(6)
      expect( @user.words_count ).to eq(7)
    end
  end

end

require 'rails_helper'

RSpec.describe Like, type: :model do

  user = User.create(fname: 'Johnny', lname: 'Vegas', email: 'johnny.vegas@example.com', password: 'password')
  post = Post.create(message: 'Hello world!', user_id: user.id)
  Like.create(user_id: user.id, post_id: post.id)

  before(:each) do
    @user = User.last
    @post = Post.last
    @like = Like.last
  end

  it "to be valid" do
    expect(@like).to_not eq false
  end

  it "has user_id" do
    expect(@like.user_id).to eq @user.id
  end

  it "has post_id" do
    expect(@like.post_id).to eq @post.id
  end

  it "post has a @like" do
    expect(@post.likes.last).to eq @like
  end

  it "user has a @like" do
    expect(@user.likes.last).to eq @like
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do

  it "空のパスワードを許さない" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
  it "空の名前を許さない" do
    user = User.new(name: "", email: "panda.excampel.com", password: "password")
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "空のメールアドレスを許さない" do
    user = User.new(name: "panda", email: "", password: "password")
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it "6文字未満のパスワードを許さない" do
    user = User.new(name: "panda", email: "panda.excampel.com", password: "pass")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
  it "無効なメールアドレスフォーマットを許さない" do
    user = User.new(name: "panda", email: "panda.excampel.com", password: "password")
    user.valid?
    expect(user.errors[:email]).to include("is not a valid email format")
  end
end

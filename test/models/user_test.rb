require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
  assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

    test "should follow and unfollow a user" do
    xxx = users(:xxx)
    yyy  = users(:yyy)
    assert_not xxx.following?(yyy)
    xxx.follow(yyy)
    assert xxx.following?(yyy)
    assert yyy.followers.include?(xxx)
    xxx.unfollow(yyy)
    assert_not xxx.following?(yyy)
  end

  test "feed should have the right posts" do
    xxx = users(:xxx)
    yyy = users(:yyy)
    zzz = users(:zzz)
    # フォローしているユーザーの投稿を確認
    zzz.microposts.each do |post_following|
      assert xxx.feed.include?(post_following)
    end
    # 自分自身の投稿を確認
    xxx.microposts.each do |post_self|
      assert xxx.feed.include?(post_self)
    end
    # フォローしていないユーザーの投稿を確認
    yyy.microposts.each do |post_unfollowed|
      assert_not xxx.feed.include?(post_unfollowed)
    end
  end
end

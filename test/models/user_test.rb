require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "example one", email: "example@one.com", password: "onetwo1", password_confirmation: "onetwo1")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "name should be not too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should be not too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    user_dup = @user.dup
    @user.save
    assert_not user_dup.valid?
  end

  test "email should be saved as lowercase" do
    email_upper = "LAZY@eXAMple.Com"
    @user.email = email_upper
    @user.save
    assert_equal email_upper.downcase, @user.reload.email
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 7
    assert_not @user.valid?
  end

  test "password should be minimum length of 7" do
    @user.password = @user.password_confirmation = "a" * 6
    assert_not @user.valid?
  end
end

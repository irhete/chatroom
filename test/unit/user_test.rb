require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    user = User.new
    user.name = "user123"
    user.password = "pass123"
    user.password_confirmation = "pass123"
    user.save
  end

  def test_save_user
    user = User.new
    user.name = "irhete"
    user.password = "pass123"
    user.password_confirmation = "pass123"
    assert user.save
  end

  def test_no_name
    user = User.new
    user.password = "pass123"
    user.password_confirmation = "pass123"
    assert !user.save
  end

  def test_no_password
    user = User.new
    user.name = "irhete"
    user.password_confirmation = "pass123"
    assert !user.save
  end

   def test_no_password_confirmation
    user = User.new
    user.name = "irhete"
    user.password = "pass123"
    assert !user.save
  end

  def test_short_username
    user = User.new
    user.name = "irene"
    user.password = "pass123"
    user.password_confirmation = "pass123"
    assert !user.save
  end

  def test_short_password
    user = User.new
    user.name = "irhete"
    user.password = "pass1"
    user.password_confirmation = "pass1"
    assert !user.save
  end

  def test_passwords_dont_match
    user = User.new
    user.name = "irhete"
    user.password = "pass123"
    user.password_confirmation = "pass231"
    assert !user.save
  end

  def test_uniqueness
    user = User.new
    user.name = "User123"
    user.password = "pass123"
    user.password_confirmation = "pass123"
    assert !user.save
  end
end

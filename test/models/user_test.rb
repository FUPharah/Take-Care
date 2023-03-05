require "test_helper"


class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "should not save user without first name" do
      user = User.new(last_name: "Doe", age: 25, email: "johndoe@example.com", password: "password")
      assert_not user.save, "Saved the user without a first name"
    end

    test "should not save user without last name" do
      user = User.new(first_name: "John", age: 25, email: "johndoe@example.com", password: "password")
      assert_not user.save, "Saved the user without a last name"
    end

    test "should not save user with invalid email format" do
      user = User.new(first_name: "John", last_name: "Doe", age: 25, email: "johndoeexample.com", password: "password")
      assert_not user.save, "Saved the user with an invalid email format"
    end

    test "should save user with valid attributes" do
      user = User.new(first_name: "John", last_name: "Doe", age: 25, email: "johndoe@example.com", password: "password")
      assert user.save, "Could not save the user with valid attributes"
    end
end

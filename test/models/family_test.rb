require "test_helper"

class FamilyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(
      first_name: "John",
      last_name: "Doe",
      age: 30,
      email: "john@example.com",
      password: "password",
      password_confirmation: "password"
    )

    @family = Family.new(
      first_name: "Jane",
      last_name: "Doe",
      age: 25,
      user_id: @user.id
    )
  end

  test "should be valid" do
    assert @family.valid?
  end

  test "first name should be present" do
    @family.first_name = "   "
    assert_not @family.valid?
  end

  test "last name should be present" do
    @family.last_name = "   "
    assert_not @family.valid?
  end

  test "age should be present" do
    @family.age = nil
    assert_not @family.valid?
  end

  test "age should be greater than 0" do
    @family.age = 0
    assert_not @family.valid?
  end
end

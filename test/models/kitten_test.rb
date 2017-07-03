require 'test_helper'

class KittenTest < ActiveSupport::TestCase
  def setup
    @kitten = Kitten.new(name: "John", age: 3, cuteness: 6, softness: 9)
  end

  test "should be valid" do
    assert @kitten.valid?
  end

  test "name should be present" do
    @kitten.name = "     "
    assert_not @kitten.valid?
  end

  test "age should be present" do
    @kitten.age = nil
    assert_not @kitten.valid?
  end

  test "age should be an integer greater than 0" do
  	@kitten.age = "Blah"
    assert_not @kitten.valid?
    @kitten.age = -1
    assert_not @kitten.valid?
  end

  test "cuteness should be present" do
    @kitten.cuteness = nil
    assert_not @kitten.valid?
  end

  test "softness should be present" do
    @kitten.softness = nil
    assert_not @kitten.valid?
  end

  test "cuteness should be an integer between 0 and 10" do
  	@kitten.cuteness = "Blah"
    assert_not @kitten.valid?
    @kitten.cuteness = 11
    assert_not @kitten.valid?
    @kitten.cuteness = -1
    assert_not @kitten.valid?
  end

  test "softness should be an integer between 0 and 10" do
  	@kitten.softness = "Blah"
    assert_not @kitten.valid?
    @kitten.softness = 11
    assert_not @kitten.valid?
    @kitten.softness = -1
    assert_not @kitten.valid?
  end

  test "name should be unique" do
    duplicate_kitten = @kitten.dup
    @kitten.save
    assert_not duplicate_kitten.valid?
  end

end

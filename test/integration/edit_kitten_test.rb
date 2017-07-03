require 'test_helper'

class EditKittenTest < ActionDispatch::IntegrationTest
  def setup
    @kitten = kittens(:joe)
  end

  test "unsuccessful edit" do
    get edit_kitten_path(@kitten)
    assert_template 'kittens/edit'
    patch kitten_path(@kitten), params: { kitten: { cuteness:  "Invalid" } }
    assert_template 'kittens/edit'
  end

  test "successful edit" do
    get edit_kitten_path(@kitten)
    assert_template 'kittens/edit'
    name  = "Foo Bar"
    age = 8
    patch kitten_path(@kitten), params: { kitten: { name:  name, age: age} }
    assert_not flash.empty?
    assert_redirected_to @kitten
    @kitten.reload
    assert_equal name,  @kitten.name
    assert_equal age, @kitten.age
  end
end

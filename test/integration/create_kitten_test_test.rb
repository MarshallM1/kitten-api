require 'test_helper'

class CreateKittenTestTest < ActionDispatch::IntegrationTest
  test "invalid kitten information" do
    get new_kitten_path
    assert_no_difference 'Kitten.count' do
      post kittens_path, params: { kitten: { name:  ""} }
    end
    assert_template 'kittens/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid kitten information" do
    get new_kitten_path
    assert_difference 'Kitten.count', 1 do
      post kittens_path, params: { kitten: { name:  "John", age: 3, cuteness: 7, softness: 8 } }
    end
    follow_redirect!
    assert_template 'kittens/show'
  end
end

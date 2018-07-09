require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @common_title = "Sampan App"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "#{@common_title}"
  end

  #test "should get home" do
  #  get static_pages_home_url
  #  assert_response :success
	#  assert_select "title", "Home | #{@common_title}"
  #end

  test "should get help" do
    get help_path
    assert_response :success
	  assert_select "title", "Help | #{@common_title}"
  end

  test "should get about" do
    get about_path
	  assert_response :success
	  assert_select "title", "About | #{@common_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@common_title}"
  end

end

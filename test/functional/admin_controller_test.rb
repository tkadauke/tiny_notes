require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  def setup
    @user = User.create(:full_name => 'John Doe', :email => 'john.doe@example.com', :password => '12345', :password_confirmation => '12345')
    @user.role = 'admin'
    @user.save
    
    login_with @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end

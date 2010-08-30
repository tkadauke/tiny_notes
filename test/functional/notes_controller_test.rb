require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  def setup
    @user = User.create(:full_name => 'John Doe', :email => 'john.doe@example.com', :password => '12345', :password_confirmation => '12345')
  end

  test "should get index without any notes" do
    get :index
    assert_response :success
  end
  
  test "should get index with notes" do
    note = create_note
    get :index
    assert_response :success
  end
  
  test "should show note" do
    note = create_note
    get :show, :id => note
    assert_response :success
  end
  
  test "should get new" do
    login_with @user
    get :new
    assert_response :success
  end
  
  test "should create note" do
    login_with @user

    assert_difference 'Note.count' do
      post :create, :note => { :title => 'Hello world', :text => 'This is new' }
      assert_not_nil flash[:notice]
      assert_response :redirect
    end
  end
  
  test "should not create invalid note" do
    login_with @user

    assert_no_difference 'Note.count' do
      post :create
      assert_nil flash[:notice]
      assert_response :success
      assert_template 'new'
    end
  end
  
  test "should get edit" do
    login_with @user

    note = create_note(:user => @user)
    get :edit, :id => note
    assert_response :success
  end
  
  test "should update note" do
    login_with @user

    note = create_note(:user => @user)
    
    put :update, :id => note, :note => { :title => 'Hello universe' }
    assert_not_nil flash[:notice]
    assert_equal 'Hello universe', note.reload.title
  end
  
  test "should destroy note" do
    login_with @user

    note = create_note(:user => @user)
    
    assert_difference 'Note.count', -1 do
      delete :destroy, :id => note
      assert_not_nil flash[:notice]
      assert_response :redirect
    end
  end

  test "should not get edit for other user's note" do
    login_with @user

    note = create_note
    get :edit, :id => note
    assert_access_denied
  end
  
  test "should not update note for other user's note" do
    login_with @user

    note = create_note
    
    put :update, :id => note, :note => { :title => 'Hello universe' }
    assert_access_denied
  end
  
  test "should not destroy note for other user's note" do
    login_with @user

    note = create_note
    
    assert_no_difference 'Note.count', -1 do
      delete :destroy, :id => note
      assert_access_denied
    end
  end
  
  test "should not get edit for guest" do
    note = create_note
    get :edit, :id => note
    assert_access_denied
  end
  
  test "should not update note for guest" do
    note = create_note
    
    put :update, :id => note, :note => { :title => 'Hello universe' }
    assert_access_denied
  end
  
  test "should not destroy note for guest" do
    note = create_note
    
    assert_no_difference 'Note.count', -1 do
      delete :destroy, :id => note
      assert_access_denied
    end
  end
  
protected
  def create_note(attributes = {})
    Note.create!(attributes.merge(:title => 'Hello world', :text => 'This is new'))
  end
end

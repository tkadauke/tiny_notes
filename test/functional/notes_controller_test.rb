require 'test_helper'

class NotesControllerTest < ActionController::TestCase
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
  
  test "should create note" do
    assert_difference 'Note.count' do
      post :create, :note => { :title => 'Hello world', :text => 'This is new' }
      assert_not_nil flash[:notice]
      assert_response :redirect
    end
  end
  
  test "should not create invalid note" do
    assert_no_difference 'Note.count' do
      post :create
      assert_nil flash[:notice]
      assert_response :success
      assert_template 'new'
    end
  end
  
  test "should get edit" do
    note = create_note
    get :edit, :id => note
    assert_response :success
  end
  
  test "should update note" do
    note = create_note
    
    put :update, :id => note, :note => { :title => 'Hello universe' }
    assert_not_nil flash[:notice]
    assert_equal 'Hello universe', note.reload.title
  end
  
  test "should destroy note" do
    note = create_note
    
    assert_difference 'Note.count', -1 do
      delete :destroy, :id => note
      assert_not_nil flash[:notice]
      assert_response :redirect
    end
  end
  
protected
  def create_note
    Note.create!(:title => 'Hello world', :text => 'This is new')
  end
end

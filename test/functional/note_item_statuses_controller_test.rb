require 'test_helper'

class NoteItemStatusesControllerTest < ActionController::TestCase
  test "should save checked items" do
    note = create_note
    
    assert_difference 'NoteItemStatus.count', 2 do
      put :update, :note_id => note, :note_item_ids => [ 'abcdef', 'fedbca' ]
      assert_response :redirect
    end
  end
  
protected
  def create_note
    Note.create!(:title => 'Hello world', :text => "* This is new\n* This too")
  end
end

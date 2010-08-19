require 'test_helper'

class NotesHelperTest < ActionView::TestCase
  test "should render note" do
    text = "* Item one\n* Item two\n* Item three"
    @statuses = []
    
    result = render_note(text)
    assert result =~ /checkbox/
  end
  
  test "should mark done items as done" do
    text = "* Item one\n* Item two\n* Item three"
    @statuses = [NoteItemStatus.new(:item_id => Digest::MD5.hexdigest('Item one'))]
    
    result = render_note(text)
    assert result =~ /done/
  end
end

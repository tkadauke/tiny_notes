module NotesHelper
  def render_note(text)
    html = RedCloth.new(text).to_html
    html.gsub(/<li(.*?)>(.*?)(<ul>|<\/li>)/m) do
      id = Digest::MD5.hexdigest($2)
      value = ! @statuses.find { |status| status.item_id == id }.nil?
      check_box = check_box_tag "note_item_ids[]", id, value, :id => "item_#{id}", :onchange => "if (this.checked) { $(this).up('li').className='done'; } else { $(this).up('li').className=''; }"
      label = label_tag "item_#{id}", $2
      
      "<li#{$1}#{' class="done"' if value}>#{check_box} #{label}#{$3}"
    end
  end
end

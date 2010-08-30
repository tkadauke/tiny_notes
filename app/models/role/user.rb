module Role::User
  include TinyCore::Role
  
  def can_see_note?(note)
    note.public? || note.user == self
  end
  
  allow_if_owner :edit_note, :delete_note
end

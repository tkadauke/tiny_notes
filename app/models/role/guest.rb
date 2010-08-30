module Role::Guest
  include TinyCore::Role::Guest

  def can_see_note?(note)
    note.public?
  end
end

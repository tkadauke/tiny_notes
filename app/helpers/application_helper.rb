# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def revision_link
    build = TinyNotes::Version.build
    if build == 'unknown'
      I18n.t('layouts.unknown_build')
    else
      link_to(build[0..7], "http://github.com/tkadauke/tiny_notes/commit/#{TinyNotes::Version.build}")
    end
  end
end

require_relative '../../../features/base/i_main_page'

class MainPage < IMainPage

  def trait
    "android.widget.TextView id:'title'"
  end

  def await
    wait_for_elements_exist([trait])
    wait_for_animation
    self
  end

  def current_page?
    current_dialogs = query('DialogTitle', :text)
    if not current_dialogs.empty? and current_dialogs[0].include?('Update')
      touch("android.widget.Button marked:'Dismiss'")
    end

    super()
  end
end
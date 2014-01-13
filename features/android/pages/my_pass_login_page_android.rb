require_relative '../../../features/base/i_my_pass_login'

class MyPassLogin < IMyPassLogin

  def trait
    "webView css:'input[id=username]'"
  end

  def await(opts={})
    wait_for(15) do
      query("webView css:'input[id=username]'").count > 0
    end
    self
  end

  def login(user)
    performAction('set_text', 'webView', 'input[id=username]', user[:email])
    performAction('set_text', 'webView', 'input[id=password]', user[:password])

    #performAction('scroll_down')

    touch(login_button_query)

    sleep(2) #Chance to show Dialog

    current_dialogs = query("DialogTitle", :text)
    confirm_dialog = current_dialogs.include?("Confirm")
    if confirm_dialog
      touch("android.widget.Button marked:'Never'")
    end

    #wait_for(:timeout => 60, :timeout_message => "Timed out logging in") do
    #  current_dialogs = query("DialogTitle", :text)
    #
    #  empty_dialog = current_dialogs.empty?
    #  error_dialog = current_dialogs.include?("Error")
    #  no_network_dialog = current_dialogs.include?("No network available")
    #
    #  empty_dialog or error_dialog or no_network_dialog
    #end

    sleep(5) # chance to transition

    main_page = page(MainPage)

    if main_page.current_page?
      main_page.await
    else
      self
    end
  end

  def invalid_login_query
    "webView css:'span[id=custom.errors]'"
  end

  def login_button_query
    "webView css:'input[id=btnSubmit]'"
  end

  def assert_invalid_login_message
    query(invalid_login_query).count > 0
  end
end
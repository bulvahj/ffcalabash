require 'calabash-cucumber/ibase'

class MyPassLogin < Calabash::IBase

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
    touch(trait)
    await_keyboard

    keyboard_enter_text user[:email]


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
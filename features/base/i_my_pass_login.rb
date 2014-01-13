require_relative '../base/i_base_page'

class IMyPassLogin < IBasePage

  def login(user)
    raise ERROR
  end

  def invalid_login_query
    raise ERROR
  end

  def login_button_query
    raise ERROR
  end

  def assert_invalid_login_message
    raise ERROR
  end
end
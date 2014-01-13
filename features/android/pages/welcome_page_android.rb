require_relative '../../../features/base/i_welcome_page'

class WelcomePage < IWelcomePage

  def trait
    "android.widget.Button id:'first_start_anmelden_btn'"
  end

  def mypasslogin
    touch(trait)
    page(MyPassLogin).await
  end

  def await(opts={})
    wait_for_elements_exist(["* {text BEGINSWITH 'Willkommen bei 1414!'}"])
    self
  end

end
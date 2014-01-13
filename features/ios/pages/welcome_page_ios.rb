require '../../../features/base/i_welcome_page'

class WelcomePage < IWelcomePage

  def trait
    "button marked:'Anmelden'"
  end

  def mypasslogin
    transition(:tap => trait, :page => MyPassLogin)
    page(MyPassLogin).await
  end

  def await(opts={})
    wait_for_elements_exist(["* {text BEGINSWITH 'Willkommen bei 1414!'}"])
    self
  end

end
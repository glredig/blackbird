module SpecTestHelper   
  def login_admin(user)
    user = User.where(:admin => true).first
    request.session[:user] = user.id
  end

  def login(user)
    user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    request.session[:user] = user.id
  end

  def current_user
    User.find(request.session[:user])
  end
end
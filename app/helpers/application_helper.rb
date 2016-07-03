module ApplicationHelper

  def showBack
    (!(params[:controller] =='buyer/home' && params[:action]=='index') &&
        !(params[:controller] =='buyer/categories' && params[:action]=='index') &&
        !(params[:controller] =='buyer/cart' && params[:action]=='index') &&
        !(params[:controller] =='buyer/account' && params[:action]=='index'))

  end

  def showSearch
    params[:controller] =='buyer/home' && params[:action]=='index'
  end

  def showRegister
    params[:controller] =='buyer/login' && params[:action]=='register'
  end

  def is_verified
    u = User.find session[:user_id]
    return u.is_verified
  end


end

class Api::LoginController < ApplicationController

  def login_action
    output = {"test"=>1,"test2"=>2}


    render json: output
  end

  def do_login_action
    user_id = params[:user][:id]
    pwd = params[:user][:pw]
    token = User.get_user_login_token(user_id,pwd)
    status="success"
    if token.nil?
      status="no_found"
    elsif token==false
      status="failed"
    end
    result = {"status"=>status,"token"=>token}
    render json: result
  end

  def do_pw_recover
    email = params[:email]
    user = User.find_user(email)
    unless user.nil?
      send_recover_email(email)
    end

  end


  private def send_recover_email(email)

  end





end

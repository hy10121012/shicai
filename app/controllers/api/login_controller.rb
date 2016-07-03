class Api::LoginController < ApplicationController

  def login_action
    output = {"test"=>1,"test2"=>2}


    render json: output
  end

  def do_login_action
    user_id = params[:name]
    pwd = params[:pwd]
    user = User.get_user_login(user_id,pwd)
    token = nil
    status="success"
    if user.nil?
      status="no_found"
    elsif user==false
      status="failed"
    else
      puts 'login success'
      session[:user_id]=user.id
      session[:user_type] = user.user_type
      session[:user_name] = user.name
      token = user.token
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

  def do_create_user
    phone=params[:phone].to_s
    email = params[:email]
    pwd = params[:pw].to_s
    type = params[:user_type]

    user = User.create(phone:phone,email:email,pw:Digest::MD5.hexdigest(pwd),user_type:type,is_verified:false)
    if user.save
      render text: true
    else
      render text: false
    end

  end



  def send_recover_email(email)

  end





end

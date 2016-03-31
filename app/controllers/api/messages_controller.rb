class Api::MessagesController < ApplicationController

  def set_read
    #设置消息为已读
  end

  def send_message
    #发送消息
    content = params[:content]
    sender_id = session[:user_id]
    receiver_id = params[:user_id]
    rs = Conversation.send_message sender_id, receiver_id, content, session[:user_id]
    render text: rs
  end

  def find_messages
    #读取更多信息
    offset=0
    unless !params[:offset].nil?
      offset = params[:offset]
    end
    rs = Conversation.find_conversations session[:user_id] ,offset
    render json: rs
  end

  def find_conversation_text
    rs = ConversationText.where('conversation_id=?', params[:conv_id]).order('created_at desc').limit(20)
    render json: rs
  end


end

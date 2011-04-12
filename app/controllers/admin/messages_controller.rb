class Admin::MessagesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  before_filter :find_message, :except => :index

  def index
    @messages = Message.all_items
  end

  def edit
  end

  def update
    @message.body = params[:message][:body]
    if @message.save
      flash[:notice] = 'Message has been updated'
      redirect_to admin_messages_path
    else
      render :edit
    end
  end

  private

  def find_message
    @message = Message.find_item_by_code params[:id]
    page_not_found('Message not found') unless @message
  end
end

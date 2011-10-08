class MessagesController < ApplicationController

layout 'aurelius'

  def index
    @messages = Message.order("messages.anniversary_type")
    render ("list")
  end

  def list
    @messages = Message.order("messages.anniversary_type")
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end  

  def create
    # Instantiate a new object using form parameters
    @message = Message.new(params[:message])
    # Save the object
    if @message.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Message created!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    # Find object using form parameters
    @message = Message.find(params[:id])
    # Update the object
    if @message.update_attributes(params[:message])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Message updated!"
      redirect_to(:action => 'show', :id => @message.id)
    else
    # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def enable
    @message = Message.find(params[:id])
  end

    def enabled
    # Find object using form parameters
    message = Message.find(params[:id])
    message.status =  'enabled'
    # Update the object
    if message.update_attributes(params[:message])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Message Enabled!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('enable')
    end
  end

  def disable
    @message = Message.find(params[:id])
  end

  def disabled
    # Find object using form parameters
    message = Message.find(params[:id])
    message.status =  'disabled'
    # Update the object
    if message.update_attributes(params[:message])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Message disabled!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('delete')
    end
  end
end

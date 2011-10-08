class StatusController < ApplicationController

layout 'aurelius'

  def index
    @statuses = Status.order("statuses.anniversary_type ASC")
    render ("list")
  end

  def list
    @statuses = Status.order("statuses.anniversary_type ASC")
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end  

  def create
    # Instantiate a new object using form parameters
    @status = Status.new(params[:status])
    # Save the object
    if @status.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Status created!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    # Find object using form parameters
    @status = Status.find(params[:id])
    # Update the object
    if @status.update_attributes(params[:status])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Status updated!"
      redirect_to(:action => 'show', :id => @status.id)
    else
    # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def enable
    @status = Message.find(params[:id])
  end

    def enabled
    # Find object using form parameters
    message = Status.find(params[:id])
    message.status =  'enabled'
    # Update the object
    if message.update_attributes(params[:status])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Status Enabled!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('enable')
    end
  end

  def disable
    @status = Status.find(params[:id])
  end

  def disabled
    # Find object using form parameters
    message = Message.find(params[:id])
    message.status =  'disabled'
    # Update the object
    if celebrity.update_attributes(params[:status])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Message disabled!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('delete')
    end
  end
end

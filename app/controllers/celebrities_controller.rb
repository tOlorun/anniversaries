class CelebritiesController < ApplicationController

layout 'aurelius'

  def index
    #@celebrities = Celebrity.order("celebrities.last_name ASC")
    @celebrities = Celebrity.find(:all, :include => :anniversaries)
    #.order("celebrities.last_name ASC")
    render ("list")
  end

  def list
    @celebrities = Celebrity.order("celebrities.last_name ASC")
  end

  def show
    @celebrity = Celebrity.find(params[:id])
  end

  def new
    @celebrity = Celebrity.new
  end  

  def create
    # Instantiate a new object using form parameters
    @celebrity = Celebrity.new(params[:celebrity])
    # Save the object
    if @celebrity.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Celebrity created!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @celebrity = Celebrity.find(params[:id])
  end

  def update
    # Find object using form parameters
    @celebrity = Celebrity.find(params[:id])
    # Update the object
    if @celebrity.update_attributes(params[:celebrity])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Celebrity updated!"
      redirect_to(:action => 'show', :id => @celebrity.id)
    else
    # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

    def enable
    @celebrity = Celebrity.find(params[:id])
  end

    def enabled
    # Find object using form parameters
    celebrity = Celebrity.find(params[:id])
    celebrity.status =  'enabled'
    # Update the object
    if celebrity.update_attributes(params[:celebrity])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Celebrity Enabled!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('enable')
    end
  end

  def disable
    @celebrity = Celebrity.find(params[:id])
  end

  def disabled
    # Find object using form parameters
    celebrity = Celebrity.find(params[:id])
    celebrity.status =  'disabled'
    # Update the object
    if celebrity.update_attributes(params[:celebrity])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Celebrity disabled!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('delete')
    end
  end

end

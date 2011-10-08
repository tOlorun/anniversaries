class AnniversariesController < ApplicationController

	layout 'aurelius'

  before_filter :find_celebrity
	
  def index
    @anniversaries ||= Anniversary.where(:celebrity_id => @celebrity.id).order("anniversaries.anniversary_type ASC")
    render ("list")
  end

  def list
    @anniversaries ||= Anniversary.where(:celebrity_id => @celebrity.id).order("anniversaries.anniversary_type ASC")
  end

  def show
    @anniversary = Anniversary.find(params[:id])
    #@anniversary = Anniversary.find(params[:id]).where(:celebrity_id => @celebrity.id)
  end

  def new
    @anniversary = Anniversary.new(:celebrity_id => @celebrity.id)
    @anniversary_types ||= Message.order("messages.anniversary_type asc")
  end

  def create
    # Instantiate a new object using form parameters
    @anniversary = Anniversary.new(params[:anniversary])
    # Save the object
    if @anniversary.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Anniversary created!"
      redirect_to(:action => 'list', :celebrity_id => @anniversary.celebrity_id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def enable
    @anniversary = Anniversary.find(params[:id])
  end

  def enabled
    # Find object using form parameters
    anniversary = Anniversary.find(params[:id])
    anniversary.status =  'enabled'
    # Update the object
    if anniversary.update_attributes(params[:anniversary])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Anniversary Enabled!"
      redirect_to(:action => 'list', :celebrity_id => anniversary.celebrity_id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('enable')
    end
  end

  def edit
    @anniversary = Anniversary.find(params[:id])
    @anniversary_types ||= Message.order("messages.anniversary_type asc")
  end

  def update
    # Find object using form parameters
    @anniversary = Anniversary.find(params[:id])
    # Update the object
    if @anniversary.update_attributes(params[:anniversary])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Anniversary updated!"
      redirect_to(:action => 'show', :id => @anniversary.id, :celebrity_id => @anniversary.celebrity.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def disable
    @anniversary = Anniversary.find(params[:id])
  end

  def disabled
    # Find object using form parameters
    @anniversary = Anniversary.find(params[:id])
    @anniversary.status =  'disabled'
    # Update the object
    if @anniversary.update_attributes(params[:anniversary])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Anniversary disabled!"
      redirect_to(:action => 'list', :celebrity_id => @anniversary.celebrity.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('delete')
    end
  end

  private

  def find_celebrity
    if params[:celebrity_id]
      @celebrity = Celebrity.find_by_id(params[:celebrity_id])
    end
  end

end

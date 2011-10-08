class MenusController < ApplicationController

layout 'aurelius'

  def index
    @menus = Menu.order("menus.order")
    #@menus = Menu.where("menus.status = 'enabled'")
    render ("list")
  end

  def list
    @menus = Menu.order("menus.order")
    #@menus = Menu.where("menus.status = 'enabled'")
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
    @menu_count = Menu.count + 1
  end  

  def create
    # Instantiate a new object using form parameters
    @menu = Menu.new(params[:menu])
    # Save the object
    if @menu.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Menu created!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
    @menu_count = Menu.count + 1
      render('new')
    end
  end

  def edit
    @menu = Menu.find(params[:id])
    @menu_count = Menu.count
  end

  def update
    # Find object using form parameters
    @menu = Menu.find(params[:id])
    # Update the object
    if @menu.update_attributes(params[:menu])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Menu updated!"
      redirect_to(:action => 'show', :id => @menu.id)
    else
    # If save fails, redisplay the form so user can fix problems
    @menu_count = Menu.count
      render('edit')
    end
  end

  def enable
    @menu = Menu.find(params[:id])
  end

    def enabled
    # Find object using form parameters
    menu = Menu.find(params[:id])
    menu.status =  'enabled'
    # Update the object
    if menu.update_attributes(params[:menu])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Menu Enabled!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('enable')
    end
  end

  def disable
    @menu = Menu.find(params[:id])
  end

  def disabled
    # Find object using form parameters
    menu = Menu.find(params[:id])
    menu.status =  'disabled'
    # Update the object
    if menu.update_attributes(params[:menu])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Menu disabled!"
      redirect_to(:action => 'list')
    else
    # If save fails, redisplay the form so user can fix problems
      render('delete')
    end
  end
end

class MenusController < ApplicationController
  before_action :set_menu, only: [:set_default, :show, :edit, :update, :destroy]
  before_action :director

  def index
    @title = 'Listing Menus'
    @menus = Menu.order(:name)
  end

  def new
    @title = 'New Menu'
    @menu = Menu.new
    3.times { @menu.menu_lines.build }
  end

  def show
    @title = "Menu #{get_name}"
    @title = 'Listing Menus'
  end

  def edit
    @title = "Editing #{get_name}"
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "Menu #{get_name} created"
      redirect_to menu_path(@menu)
    else
      render 'new'
    end
  end

  def update
    if @menu.update(menu_params)
      flash[:notice] = "Menu #{get_name} updated"
      redirect_to menu_path(@menu)
    else
      render 'edit'
    end
  end

  def destroy
    @menu.destroy
    flash[:notice] = "Menu #{get_name} deleted"
    redirect_to menus_path
  end

  def set_default
    Menu.update_all(current: false)
    @menu.update(current: true)
    flash[:notice] = "#{get_name} set as default"
    redirect_to menus_path
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :description, menu_lines_attributes: [ :id, :beverage_id, :menu_id, :price, :_destroy ])
    end

    def get_name
      @menu.name
    end

end


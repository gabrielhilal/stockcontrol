class VenuesController < ApplicationController
  before_action :set_venue, only: [:edit, :update, :destroy]
  before_action :director

  def index
    @title = 'Listing Venues'
    @venues = Venue.order(params[:sort])
  end

  def new
    @title = 'New Venue'
    @venue = Venue.new
  end

  def edit
    @title = "Editing #{get_name}"
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      flash[:notice] = "Venue #{get_name} created"
      redirect_to venues_path
    else
        render 'new'
    end
  end

  def update
    if @venue.update(venue_params)
      flash[:notice] = "Venue #{get_name} updated"
      redirect_to venues_path
    else
      render 'edit'
    end
  end

  def destroy
    if @venue.users.exists?
      flash[:error] = "Venue #{get_name} cannot be deleted. Delete the related users first"
    elsif @venue.purchases.exists?
      flash[:error] = "Venue #{get_name} cannot be deleted. Delete the related purchases first"
    elsif @venue.sales.exists?
      flash[:error] = "Venue #{get_name} cannot be deleted. Delete the related sales first"
    else
      @venue.destroy
      flash[:notice] = "Venue #{get_name} deleted"
    end
    redirect_to venues_path
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :telephone, :email)
    end

  def get_name
    @venue.name
  end
end

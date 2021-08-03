class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def show; end

  def edit; end

  def create
    @route = Route.new(route_params)
    return render :new unless @route.save

    redirect_to admin_route_path(@route)
  end

  def update
    return render :edit unless @route.update(route_params)

    redirect_to admin_route_path(@route)
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path
  end

  private

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end

  def set_route
    @route = Route.find(params[:id])
  end
end

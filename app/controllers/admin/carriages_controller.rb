class Admin::CarriagesController < Admin::BaseController
  before_action :set_train, only: %i[create new]

  def new
    @carriage = Carriage.new
  end

  def show
    @carriage = Carriage.find(params[:id])
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    return render :new unless @carriage.save

    redirect_to admin_train_path(@train)
  end

  def destroy
    @carriage.destroy
    redirect_to admin_routes_path
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:type, :top_seats, :bottom_seats, :train_id, :side_bottom_seats, :side_top_seats,
                                     :eco_seats)
  end
end

class CourtsController < ApplicationController
  def index
    # Your code for index action here
    @courts = Court.all
  end

  def show
    # Your code for show action here
    @court = Court.find(params[:id])
  end

  def new
    # Your code for new action here
    @court = Court.new
  end

  def edit
    # Your code for edit action here
    @court = Court.find(params[:id])
  end

  def create
    # Your code for create action here
    @court = Court.new(court_params)
    @court.user = current_user
    if @court.save
      redirect_to court_path(@court)
    else
      render :new
    end
  end

  def update
    # Your code for update action here
    @court = Court.find(params[:id])
    if @court.update(court_params)
      redirect_to court_path(@court)
    else
      render :edit
    end
  end

  def destroy
    # Your code for destroy action here
    @court = Court.find(params[:id])
    @court.destroy
    redirect_to courts_path
  end

  private

  # Your private methods here
  def court_params
    params.require(:court).permit(:name, :address, :description, :price)
  end
end

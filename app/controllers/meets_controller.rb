class MeetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @meets = Meet.all
  end

  def show
    find_meet
  end

  def new
    @meet = Meet.new
  end

  def create
    @meet = Meet.new(meet_params)
    if @meet.save
      flash[:success]="The Meet-up was added!"
      redirect_to meets_path
    else
      render 'new'
    end
  end

    def edit
      find_meet
    end

    def destroy
      find_meet.destroy
      flash[:success]="The Meet-up was destroyed."
      redirect_to meets_path
    end


  private

  def find_meet
    @meet = Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:name, :description, :location, :meet_date, :meet_time)
  end

end

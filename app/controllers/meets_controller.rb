class MeetsController < ApplicationController
  before_action :authenticate_user!



  def index
    if request.fullpath.include?('upcoming=true') || request.fullpath.include?('past=true')
			@meets = apply_scopes(Meet).all.paginate(page: params[:page], :per_page => 5)
		else
			@meets = Meet.order("meet_date DESC").paginate(page: params[:page], :per_page => 5)
		end
  end

  def show
    find_meet
    @guests = @meet.guests
  end

  def new
    @meet = Meet.new
  end

  def create
    @user = current_user
    @meet = @user.meets.build(meet_params)
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

  def attend
    @meet.attendees << current_user
    @meet.save
  end


  private

  def find_meet
    @meet = Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:name, :description, :address, :meet_date, :meet_time)
  end

end

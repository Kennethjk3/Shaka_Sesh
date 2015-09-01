class InvitesController < ApplicationController
  before_action :authenticate_user!

  def create
  	@meet = Meet.find(params[:invite][:attended_id])
  	current_user.invites.create(attended_id: @meet.id)
  	redirect_to(:back)
  end

  def destroy
  	@invite = Invite.find(params[:id])
  	current_user.invites.destroy(@invite)
  	redirect_to(:back)
  end
end

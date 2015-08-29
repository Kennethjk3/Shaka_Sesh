class SeshesController < ApplicationController
  def index
   @seshes = Sesh.order('created_at')
 end

 def new
   @sesh = Sesh.new
 end

 def create
   @sesh = Sesh.new(sesh_params)
   if @sesh.save
     flash[:success]="The sesh was added!"
     redirect_to root_path
   else
     render 'new'
   end
 end

 def destroy
  @sesh = Sesh.find(params[:id])
  @sesh.destroy
  flash[:success]="The sesh was destroyed."
  redirect_to root_path
end

 private

 def sesh_params
   params.require(:sesh).permit(:image, :title)
 end
end

class DrawingsController < ApplicationController
  def index
    @drawings = current_user.drawings
  end

  def show
    @drawing = current_user.drawings.find(params[:id])
  end

  def create
    @drawing = current_user.drawings.new(drawing_params)
    @drawing.save
    redirect_to templates_path
  end

  def update
    @drawing = current_user.drawings.find(params[:id])
    @drawing.update_attributes(drawing_params)
    @drawing.save
  end

  def destroy
    @drawing = current_user.drawings.find(params[:id])
    @drawing.destroy
    redirect_to drawings_path
  end

  private

  def drawing_params
    params.require(:drawing).permit(:template_id, :user_id)
  end

end

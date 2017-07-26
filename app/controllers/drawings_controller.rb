require 'RMagick'
require 'open-uri'
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

    image_content = open(URI.join(request.url, @drawing.template.image.url)).read
    image = Magick::ImageList.new()
    image.from_blob(image_content)

    image = image.resize_to_fit(800, 800)
    image = image.threshold(Magick::QuantumRange*0.5)
    image = image.crop(2, 2, image.columns-4, image.rows-4)

    file = Paperclip::Tempfile.new(["template", ".png"])
    image.write(file.path)
    @drawing.image = file
    @drawing.save

    redirect_to drawing_path(@drawing.id)
  end

  def update
    @drawing = current_user.drawings.find(params[:id])
    # color image
    image_content = open(URI.join(request.url, @drawing.image.url)).read
    image = Magick::ImageList.new()
    image.from_blob(image_content)

    x,y = params[:x].to_f, params[:y].to_f
    x = (x * image.columns).to_i
    y = (y * image.rows).to_i
    color = params[:color]
    puts x, y, color, image.pixel_color(x,y)

    if image.pixel_color(x,y).intensity() > 0.01 * Magick::QuantumRange
      image = image.color_floodfill(x,y,color)
      file = Paperclip::Tempfile.new(["processed", ".png"])
      image.write(file.path)
      @drawing.image = file
      @drawing.save
    end

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

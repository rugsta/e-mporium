class ImagesController < ApplicationController


  def index
    @images = Image.all
  end


  def destroy
    @image = Image.find(params[:id])
    FileUtils.remove_dir "#{Rails.root}/public/system/images/#{@image.id}"
    @image.delete

    redirect_to(edit_product_path)
  end


  def show
    @image = Image.find(params[:id])
  end


  private

  def image_params
    params.require(:image).permit(:product_id, :image, :image_file_name)
  end
end
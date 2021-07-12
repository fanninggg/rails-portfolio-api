class Api::V1::ImagesController < Api::V1::BaseController
	acts_as_token_authentication_handler_for User

  def create
    @image = Image.new(image_params)
    @image.project = Project.find(params[:project_id])
    authorize @image
    if @image.save
      render json: {message: "Image Uploaded"}
    else
      render_error
    end
  end

  def destroy
    @image = Image.find(params[:id])
    authorize @image
    @image.destroy
    head :no_content
  end

  private

  def image_params
    params.require(:image).permit(:href)
  end

  def render_error
    render json: { errors: @image.errors.full_messages },
      status: :unprocessable_entity
  end

end
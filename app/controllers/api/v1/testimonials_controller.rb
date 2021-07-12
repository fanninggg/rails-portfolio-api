class Api::V1::TestimonialsController < Api::V1::BaseController
	acts_as_token_authentication_handler_for User, only: [ :update, :create, :destroy ]
	before_action :set_testimonial, only: [ :show, :update, :destroy ]

  def index
    @testimonials = policy_scope(Testimonial)
  end

  def clients
    @testimonials = Testimonial.where(source: 'client')
    authorize @testimonials
    render :index
  end

  def students
    @testimonials = Testimonial.where(source: 'student')
    authorize @testimonials
    render :index
  end

  def colleagues
    @testimonials = Testimonial.where(source: 'colleague')
    authorize @testimonials
    render :index
  end

  def show
  end

  def update
    if @testimonial.update(testimonial_params)
      render :show
    else
      render_error
    end
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.user = current_user
    authorize @testimonial
    if @testimonial.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @testimonial.destroy
    head :no_content
  end

  private

  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
    authorize @testimonial
  end

  def testimonial_params
    params.require(:testimonial).permit(:author, :position, :splash, :content, :avatar, :source)
  end

  def render_error
    render json: { errors: @testimonial.errors.full_messages },
      status: :unprocessable_entity
  end

end
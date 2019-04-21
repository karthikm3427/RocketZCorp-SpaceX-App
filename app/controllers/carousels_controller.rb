class CarouselsController < ApplicationController

	def index
		@slides = Carousel.all
	end

	def new
		@slide = Carousel.new
	end

	def create
		@slide = Carousel.new(slide_params)
		if @slide.save
			redirect_to '/carousels'
		else
			render 'new'
		end  
	end

	def show
		@slide = Carousel.find(params[:id])
	end

	def edit
		@slide = Carousel.find(params[:id])
	end

	def update
		@slide = Carousel.find(params[:id])
		if @slide.update(slide_params)
			redirect_to @slide
		else
			render 'edit'
		end
	end

	def destroy
		@slide = Carousel.find(params[:id])
		@slide.destroy
		redirect_to 'index'
	end

	private

	def slide_params
		params.require(:carousel).permit(:banner, :slidetitle1, :slidetitle2)
	end
end

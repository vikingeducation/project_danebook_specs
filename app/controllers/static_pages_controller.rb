class StaticPagesController < ApplicationController
	def index
		@page = params[:page]
		if @page.nil?
			render 'home_page'
		else
			render @page
		end
	end
end

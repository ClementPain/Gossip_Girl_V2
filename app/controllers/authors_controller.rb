class AuthorsController < ApplicationController

	def show
		@author_searched = User.find(params[:id]) 
	end

end

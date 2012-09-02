class UrlsController < ApplicationController
  def new
  	@shortened_url = Url.new
  end

  def create
  	@shortened_url = Url.new(params[:url])
  	if @shortened_url.save
  		flash[:short_url] = @shortened_url.short_code
  		redirect_to new_url_url
  	else
  		render :action => "new"
  	end
  end

  def show
  	@shortened_url = Url.find_using_short_code!(params[:id])
  	redirect_to "http://" + @shortened_url.url
  end
end

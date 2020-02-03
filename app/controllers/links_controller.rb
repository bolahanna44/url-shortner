class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(links_params)
    flash.now.alert = @link.errors.full_messages.to_sentence unless @link.save
    render :new
  end

  def show
    url = Link.find_by!(short_url: params[:short_url])
    redirect_to(url.original_url)
  end

  def links_params
    params.permit(:original_url)
  end
end

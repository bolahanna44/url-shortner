class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound do |e|
    redirect_to '/404.html', status: :not_found
  end
end

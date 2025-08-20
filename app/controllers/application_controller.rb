class ApplicationController < ActionController::API
  before_action :set_current_user
  before_action :authenticate_user!

  def authenticate_user!
    unless current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def set_current_user
    @current_user ||= User.first
  end

  def current_user
    @current_user
  end
end

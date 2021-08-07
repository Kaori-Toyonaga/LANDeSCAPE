class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :login_required
  # before_filter :set_request_from
  #
  # def set_request_from
  #     if session[:request_from]
  #       @request_from = session[:request_from]
  #     end
  #     # 現在のURLを保存しておく
  #     session[:request_from] = request.original_url
  # end
  #
  # def return_back
  #   if request.referer
  #     redirect_to :back and return true
  #   elsif @request_from
  #     redirect_to @request_from and return true
  #   end
  # end

  private
  def login_required
    redirect_to new_session_path unless current_user
  end

end

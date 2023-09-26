# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if !current_user == nil?
      @uploads = Upload.all.paginate(page: params[:page], per_page: 4)
    else
      redirect_to new_user_session_path
    end
  end
end

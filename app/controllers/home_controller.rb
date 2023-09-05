# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @uploads = Upload.all.paginate(page: params[:page], per_page: 4)
  end
end

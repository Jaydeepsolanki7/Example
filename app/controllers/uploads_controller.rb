# frozen_string_literal: true

class UploadsController < ApplicationController
  def index
    @uploads = current_user.uploads.paginate(page: params[:page], per_page: 4)
  end

  def new
    @upload = Upload.new
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def create
    @user = User.find_by(id: current_user.id)
    @upload = @user.uploads.create(upload_params)
    if @upload.save
      redirect_to user_uploads_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @upload = Upload.find(params[:id])
  end

  def update
    @upload = Upload.find(params[:id])

    if @upload.update(upload_params)
      redirect_to upload_path(@upload)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to user_uploads_path(@upload)
  end

  private

  def upload_params
    params.require(:upload).permit!
  end
end

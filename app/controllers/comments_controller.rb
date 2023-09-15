# frozen_string_literal: true
# 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
class CommentsController < ApplicationController
  before_action :set_upload, only: %i[create destroy]
  before_action :set_comment, only: :destroy

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = upload_comments.create(comment_params)

    redirect_to upload_path(@upload) if @comment.save
  end

  def destroy
    @comment.destroy

    redirect_to upload_path(@upload), status: :see_other
  end

  private

  def set_upload
    @upload = Upload.find(params[:upload_id])
  end

  def set_comment
    @comment = upload_comments.find(params[:id])
  end

  def upload_comments
    @upload.comments
  end

  def comment_params
    params.require(:comment).permit!
  end
end

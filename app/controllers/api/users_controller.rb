class Api::UsersController < Api::ApplicationController
  before_action :set_author, only: [:show]
  def index
    authors = User.all.order(:id)
    render json: authors, status: :ok
  end
  def show
    render json: @author, status: :ok
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = User.find(params[:id])
  end
end

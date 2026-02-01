class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show ]

  # GET /authors or /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
    @pagy, @posts = pagy(:countless, Post.where(author: @author, published: true).order(updated_at: :desc), limit: 9)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # Patch
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find_by(name: params.expect(:name))
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.expect(author: [ :avatar, :first_name, :last_name, :email, :blurb, :name ])
    end
end

class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show ]

  # GET /authors or /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
    @posts = Post.where(author: @author, published: true)
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

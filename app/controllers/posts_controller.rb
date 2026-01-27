class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]

  # Infinite scoll setup
  # https://cycode.com/blog/infinite-scrolling-pagination-hotwire/
  # GET /posts or /posts.json
  def index
    @pagy, @posts = pagy(:countless, Post.where(published: true).order(updated_at: :desc), limit: 9)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # Patch
    end
  end

  def show
    current_id = @post.id
    @prev_post = Post.where("id < ?", current_id).last
    @next_post = Post.where("id > ?", current_id).first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end 

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :title, :body, :published, :publication_date, :slug ])
    end
end

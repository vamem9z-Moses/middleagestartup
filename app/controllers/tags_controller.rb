class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @pagy, @posts = pagy(:countless, Post.where(published: true).order(updated_at: :desc), limit: 9)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # Patch
    end
  end

  private
    def set_tag
      @tag = Tag.find_by(name: params.expect(:name))
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.expect(tag: [ :name ])
    end
end

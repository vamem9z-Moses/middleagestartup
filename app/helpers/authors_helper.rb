module AuthorsHelper
  def published_posts(author)
    num_posts = Post.where(author: author, published: true).count
    pluralize(num_posts, "Published post", "Published Posts")
  end
end

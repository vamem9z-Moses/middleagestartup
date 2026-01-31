module TagsHelper
  # https://tailwindcss.com/docs/detecting-classes-in-source-files#safelisting-classes
  def show_tags(tags)
    tags.map do |tag|
      num_posts = count_tag_usage(tag)
      dom_classes = [ "inline-flex text-red-800 bg-red-200/8 font-medium text-sm py-1 px-3 rounded-full",
                    "inline-flex text-blue-800 bg-blue-200/8 font-medium text-sm py-1 px-3 rounded-full",
                    "inline-flex text-purple-800 bg-purple-200/8 font-medium text-sm py-1 px-3 rounded-full",
                    "inline-flex text-orange-800 bg-orange-200/8 font-medium text-sm py-1 px-3 rounded-full",
                    "inline-flex text-green-800 bg-green-200/8 font-medium text-sm py-1 px-3 rounded-full"
      ]
      tag_name = "#{tag.name} (#{num_posts})"
      dom_class = dom_classes.sample
      link_to tag_name, tag,
        class: dom_class
    end.join.html_safe
  end

  def count_tag_usage(tag)
     Post.where(published: true).joins(:tags).where(tags: { name: tag.name }).count
  end
end

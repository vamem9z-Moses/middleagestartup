module TagsHelper
  # https://tailwindcss.com/docs/detecting-classes-in-source-files#safelisting-classes
  # Note: LEAVE THESE! They need to be scanned by tailwind for inclusion in the generated css.
  # This is necessary for the colors to show since the colors are dynamically generated.
  # text-pink bg-pink/8
  # text-blue bg-blue/8
  # text-cyan bg-cyan/8
  # text-pink bg-pink/8
  # text-green bg-green/8
  # text-purple bg-purple/8
  def show_tags(tags)
    tags.map do |tag|
      num_posts = count_tag_usage(tag)
      tag_colors = [ "blue", "green", "pink", "cyan", "purple" ]
      tag_color = tag_colors.sample
      tag_name = "#{tag.name} (#{num_posts})"
      dom_class = "inline-flex text-green bg-#{tag_color}/8 font-medium text-sm py-1 px-3 rounded-full"
      link_to tag_name, tag,
        class: dom_class
    end.join.html_safe
  end

  def count_tag_usage(tag)
     Post.where(published: true).joins(:tags).where(tags: { name: tag.name }).count
  end
end

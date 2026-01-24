require "faker"
require_relative "seed_helper"

class PostSeed
  include SeedHelper

  def create_posts
    create_post_items
  end

  private

    def create_post_items
      50.times do |index|
        create_post_item
      end
    end

    def create_post_item
      start_time = Time.new(2020, 1, 1, 0, 0, 0)
      end_time = Time.current
      published = Faker::Boolean.boolean(true_ratio: 0.8)
      published_date = random_time(start_time, end_time) if published

      created_at = published ? published_date - 1.day : random_time(start_time, end_time)
      updated_at = created_at + rand(1...20).day
      post = Post.create!(title: Faker::Book.unique.title,
                  published: published,
                  body: ActionText::RichText.new(
                    body: Faker::HTML.sandwich(sentences: 5, repeat: 4)),
                  publication_date: published_date,
                  created_at: created_at,
                  updated_at: updated_at)
      post.save
    end
end

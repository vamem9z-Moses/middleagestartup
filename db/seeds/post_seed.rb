require "faker"
require_relative "seed_helper"

class PostSeed
  include SeedHelper

  def create_posts
    @author_avatars = [ "business-man.jpg", "mafia-man.jpg", "young-man.jpg" ]
    @featured_images = [ "balloons-unsplash.jpg", "beach-unsplash.jpg", "chips-unsplash.jpg", "cloud-city-unsplash.jpg", "compass-unsplash.jpg", "dark-cloud-unsplash.jpg", "earth-unsplash.jpg",
                        "greenhouse-unsplash.jpg", "highway-unsplash.jpg", "lilac-unsplash.jpg", "pyramid-unsplash.jpg", "robot-unsplash.jpg", "sphere-unsplash.jpg", "sunset-unsplash.jpg",
                        "tunnel-unsplash.jpg" ]
    create_authors
    create_featured_images
    create_tags
    create_post_items
  end

  private

    def create_post_items
      50.times do |index|
        create_post_item
      end
    end

    def create_authors
      5.times do |index|
        author = Author.create!(first_name: Faker::Name.male_first_name,
                                last_name: Faker::Name.last_name,
                                email: Faker::Internet.email,
                                blurb: Faker::Quote.yoda)
        avatar = @author_avatars.sample
        author.avatar.attach(io: File.open(Rails.root.join("db/seeds/images/#{avatar}")), filename: avatar)
        author.save!
      end
    end

    def create_featured_images
      @featured_images.each do |image|
        featured = FeaturedImage.new(name: Faker::Lorem.sentence(word_count: 4),
                                    alt_text: Faker::Lorem.sentence(word_count: 6),
                                    attribution: Faker::Lorem.sentence(word_count: 10))
        featured.image.attach(io: File.open(Rails.root.join("db/seeds/images/#{image}")), filename: image)
        featured.save!
      end
    end

    def create_tags
      [ "General", "Marketing", "Startup", "Mistakes", "Next Steps" ].each do |name|
        Tag.create!(name: name)
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
                  author: Author.all.sample,
                  body: ActionText::RichText.new(
                    body: Faker::HTML.sandwich(sentences: 5, repeat: 4)),
                  featured_image: FeaturedImage.all.sample,
                  published: published,
                  publication_date: published_date,
                  created_at: created_at,
                  updated_at: updated_at)
      tags = select_post_tags(post)
      post.tags = tags
      post.save
    end

    def select_post_tags(post)
      tags = Tag.all.shuffle
      num_of_tags = Random.new.rand(5)
      tags.slice(0..num_of_tags)
    end
end

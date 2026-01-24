module SeedHelper
  def random_time(from, to)
    Time.at(from.to_f + rand * (to.to_f - from.to_f))
  end
end

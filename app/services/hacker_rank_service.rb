class HackerRankService
  include HTTParty
  base_uri "https://hacker-news.firebaseio.com/v0"

  def initialize(**options)
    @id = options[:id]
  end

  def best_stories
    self.class.get("/beststories.json")
  end

  def new_stories
    self.class.get("/newstories.json")
  end

  def item
    raise ArgumentError, "id is required" unless @id

    self.class.get("/item/#{@id}.json")
  end
end

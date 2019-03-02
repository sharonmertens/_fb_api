class Post

  # connect to postgres
  DB = PG.connect({
    :host => "localhost",
    :port => 5432,
    :dbname => '_fb_api_development'
    })

  # INDEX
  def self.all
    results = DB.exec("SELECT * FROM posts;")
    results.map do |result|
      {
        "id" => result["id"].to_i,
        "text" => result["text"],
        "image" => result["image"],
        "link" => result["link"],
        "likes" => result["likes"],
        "dislikes" => result["dislikes"],
        "author" => result["author"]
      }
    end # ends map do
  end # ends self.all
end # ends post class

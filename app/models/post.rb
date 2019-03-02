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

  # SHOW
  def self.find(id)
    results = DB.exec("SELECT * FROM posts WHERE id=#{id};")
    return {
      "id" => results.first["id"].to_i,
      "text" => results.first["text"],
      "image" => results.first["image"],
      "link" => results.first["link"],
      "likes" => results.first["likes"],
      "dislikes" => results.first["dislikes"],
      "author" => results.first["author"]
    }
  end # ends self.find

  # CREATE
  def self.create(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO posts (text, image, link, likes, dislikes, author)
        VALUES ('#{opts["text"]}', '#{opts["image"]}', '#{opts["link"]}', '#{opts["likes"]}', '#{opts["dislikes"]}', '#{opts["author"]}')
        RETURNING id, text, image, link, likes, dislikes, author
      SQL
    )
    return {
      "id" => results.first["id"].to_i,
      "text" => results.first["text"],
      "image" => results.first["image"],
      "link" => results.first["link"],
      "likes" => results.first["likes"],
      "dislikes" => results.first["dislikes"],
      "author" => results.first["author"]
    }
  end # ends self.create


end # ends post class

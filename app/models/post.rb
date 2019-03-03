class Post

  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  else
    DB = PG.connect(:host => 'localhost', :port => 5432, :dbname => '_fb_api_development')
  end

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

  # DELETE
  def self.delete(id)
    results = DB.exec("DELETE FROM posts WHERE id=#{id};")
    return { "deleted" => true }
  end # ends self.delete

  # UPDATE
  def self.update(id, opts)
    results = DB.exec(
      <<-SQL
        UPDATE posts
        SET text='#{opts["text"]}', image='#{opts["image"]}', link='#{opts["link"]}', likes='#{opts["likes"]}', dislikes='#{opts["dislikes"]}', author='#{opts["author"]}'
        WHERE id=#{id}
        RETURNING id, text, image, link, likes, dislikes, author;
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
  end # ends self.update


end # ends post class

class User
  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  else
    DB = PG.connect(:host => 'localhost', :port => 5432, :dbname => '_fb_api_development')
  end
  def self.all
    results = DB.exec(
      <<-SQL
        SELECT *
        FROM users
      SQL
    )
    return results.map do |result|
      {
        'id' => result['id'].to_i,
        'username' => result['username'],
        'password' => result['password'],
        'birthday' => result['birthday'],
        'image' => result['image'],
        'bio' => result['bio']
      }
    end
  end

  def self.find(id)
    result = DB.exec(
      <<-SQL
        SELECT *
        FROM users
        WHERE id = #{id}
      SQL
    )
  end

  def self.create(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO users
          (username, password, birthday, image, bio)
        VALUES
          ('#{opts['name']}', '#{opts['password']}', DATE '#{opts['birthday']}', '#{opts['image']}', '#{opts['bio']}')
        RETURNING id, username, password, birthday, image, bio
      SQL
    )
    result = results.first
    return {
      'id' => result['id'].to_i,
      'username' => result['username'],
      'password' => result['password'],
      'birthday' => result['birthday'],
      'image' => result['image'],
      'bio' => result['bio']
    }
  end

  def self.delete(id)
    restuls = DB.exec(
      <<-SQL
        DELETE FROM users WHERE id = #{id}
      SQL
    )
    return {
      'deleted': true
    }
  end

  def self.update(id, opts)
    results = DB.exec(
      <<-SQL
        UPDATE users
        SET
          username='#{opts['username']}',
          password='#{opts['password']}',
          birthday='#{opts['birthday']}',
          image='#{opts['image']}',
          bio='#{opts['bio']}'
        WHERE id = #{id}
        RETURNING id, username, password, birthday, image, bio;
      SQL
    )
    result = results.first
    return {
      'id' => result['id'].to_i,
      'username' => result['username'],
      'password' => result['password'],
      'birthday' => result['birthday'],
      'image' => result['image'],
      'bio' => result['bio']
    }
  end


end

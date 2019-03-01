class User

  DB = PG.connect({:host => 'localhost', :port => 5432, :dbname => '_fb_api_development'})
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
        INSTER INTO users
          (username, password, birthday, image, bio)
        VALUES
          ('#{opts['name']}', '#{opts['password']}', DATE '#{opts['birthday']}', '#{opts['image']}', '#{opts['bio']}')
        RETURNING id, username, password, birthday, image, bio
      SQL
    )
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

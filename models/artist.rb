require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id "
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Artist.delete_all()
    SqlRunner.run("DELETE FROM artists")
  end

  def Artist.list_all()
    artists = SqlRunner.run('SELECT * FROM artists')
    return artists.map {|artist| Artist.new(artist)}
  end

  def Artist.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artists_array = SqlRunner.run(sql, values)
    artists_hash = artists_array[0]
    artist = Artist.new(artists_hash)
    return artist
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end


end

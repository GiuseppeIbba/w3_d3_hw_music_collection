require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :genre
  attr_reader :artist_id, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i if options['artist_id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO albums (artist_id, title, genre) VALUES ($1, $2, $3) RETURNING id"
    values = [@artist_id, @title, @genre]
    @id = SqlRunner.run(sql, values)[0]['id']
  end

  def Album.delete_all
    SqlRunner.run("DELETE FROM albums")
  end

  def Album.list_all()
    albums = SqlRunner.run('SELECT * FROM albums;')
    return albums.map {|album| Album.new(album)}
  end

end

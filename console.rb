require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({
  'name'=>'Metallica'
  })
artist1.save

artist2 = Artist.new({
  'name'=>'Queen'
  })
artist2.save

album1 = Album.new({
  'title' => 'Ride the lightning',
  'genre' => 'Metal',
  'artist_id' => artist1.id
  })
album1.save

album2 = Album.new({
  'title' => '...And justice for all',
  'genre' => 'Metal',
  'artist_id' => artist1.id
  })
album2.save

album3 = Album.new({
  'title' => 'Greatest Hits I',
  'genre' => 'Rock',
  'artist_id' => artist2.id
  })

album4 = Album.new({
  'title' => 'Greatest Hits II',
  'genre' => 'Rock',
  'artist_id' => artist2.id
  })

album5 = Album.new({
  'title' => 'Greatest Hits III',
  'genre' => 'Rock',
  'artist_id' => artist2.id
  })

album3.save
album4.save
album5.save

Album.list_all
Artist.list_all

binding.pry
nil

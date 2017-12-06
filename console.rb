require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({
  'name'=>'Metallica'
  })
artist1.save

artist1 = Artist.new({
  'name'=>'Queen'
  })
artist1.save

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

Album.list_all
Artist.list_all

binding.pry
nil

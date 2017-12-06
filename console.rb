require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')



artist1 = Artist.new({
  'name'=>'Metallica'
  })
artist1.save

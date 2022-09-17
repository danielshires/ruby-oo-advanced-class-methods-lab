class Song
  attr_accessor :name, :artist_name, :song_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
  new_song = self.new
  new_song.save
  new_song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = new_by_name(song_name)
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    # Using the detect method finds the first item in an array that passes the test and returns the value
    song = self.all.detect{ |song| song.name == song_name }
    song
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) ? find_by_name(song_name) : create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(file_name)

    song_name_with_artist = file_name.split(".mp3")[0]
    artist_name = song_name_with_artist.split(" - ")[0]
    song_name = song_name_with_artist.split(" - ")[1]

    song = new_by_name(song_name)
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end


song_1 = Song.create_by_name("Blank Space")
song_2 = Song.create_by_name("Hello")
song_3 = Song.create_by_name("Hotline Bling")
# # puts Song.all.include? song_1
# puts Song.find_by_name("Hot")
song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
p song.artist_name

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|the_song| the_song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name }
  end

  def self.new_from_filename(file)
    new_song = self.new
    new_song.name = file.split(" - ")[1].split(".")[0]
    new_song.artist_name = file.split(" - ")[0]
    new_song
  end

  def self.create_from_filename(file)
    new_song = self.new
    new_song.name = file.split(" - ")[1].split(".")[0]
    new_song.artist_name = file.split(" - ")[0]
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end

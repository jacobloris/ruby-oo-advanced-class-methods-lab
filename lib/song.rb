class Song 

 
  attr_accessor :name, :artist_name 
  @@all = []

  def self.create 
    song = self.new
    self.all << song 
    song 
  end 

  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    self.all << song
    song 
  end 

  def self.create_by_name(name) 
    self.new_by_name(name)
  end 

  def self.find_by_name(name)
    results = self.all.find { |song|
      song.name == name 
    }
    results ? results : nil
  end

  def self.find_or_create_by_name(name) 
    song = self.find_by_name(name) 
    if song 
      return song 
    else 
      self.create_by_name(name)
    end 
  end 

  def self.alphabetical
    self.all.sort_by(&:name)
  end 

  def self.new_from_filename(filename) 
    data = filename.split(" - ")
    artist = data[0]
    song_name = data[1].split(".")[0]
    song = self.new 
    song.name = song_name 
    song.artist_name = artist
    song 
  end 


  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end 

  def self.all 
    @@all 
  end 

  def self.destroy_all
    self.all.clear 
  end 

end


      song_1 = Song.create_by_name("The Middle ")
      song_2 = Song.create_by_name("Blank Space")
      song_3 = Song.create_by_name("Smile Like You Mean It")
      puts Song.alphabetical


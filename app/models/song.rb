class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    if self.genre
      self.try(:genre).try(:name)
    end
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    if self.artist
      self.try(:artist).try(:name)
    end
  end

  def note_contents=(notes) #use build
    notes.each do |content|
      if content.empty? == false
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    # byebug
      note_array = self.notes.collect do |note|
        note[:content]
      end
      note_array
  end

end

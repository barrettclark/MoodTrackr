class Mood < MotionDataWrapper::Model
  FACES = {
    smile: '0x1F600',
    neutral: '0x1F610',
    frown: '0x1F622'
  }

  def self.mood_for_row(row)
    # NOTE: yeah, this seems a little buggy
    Mood.order(:created_at, ascending: false).offset(row).limit(1).all.first
  end

  def self.face(index)
    face = FACES.to_a[index]
  end
  def self.face_emoji(index)
    face(index)[1].hex.chr(Encoding::UTF_8)
  end
  def self.face_name(index)
    face(index)[0].to_s.capitalize
  end

  def self.insert_mood_for_selected_index(row)
    mood = new(emoji: face_emoji(row), name: face_name(row))
    mood.save
  end

  def self.average
    trend = :neutral
    counts = FACES.keys.inject(Hash.new) do |counts, face|
      name = face.to_s.capitalize
      counts[face] = Mood.find_all_by_name(name).count
      counts
    end.sort_by { |k,v| v }
    p counts
    counts.last[0]
  end

  def before_create
    self.created_at ||= Time.now
    p self
  end

  def created_at_pretty
    created_at.strftime("%H:%M")
  end
end

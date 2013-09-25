class Mood < MotionDataWrapper::Model

  def self.mood_for_row(row)
    # NOTE: yeah, this seems a little buggy
    Mood.order(:created_at, ascending: false).offset(row).limit(1).all.first
  end

  def before_create
    self.created_at ||= Time.now
    p self
  end

  def created_at_pretty
    created_at.strftime("%H:%M")
  end
end

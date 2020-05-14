class Result < ApplicationRecord
  belongs_to :athlete
  belongs_to :competition

  validates :result_value,
    presence: true,
    numericality: { greater_than: 0 }

  validate :competition_in_progress
  validate :athlete_can_attempt

  scope :from_athlete, -> (athlete) { where(athlete: athlete) }

  protected

  def competition_in_progress
    if competition.try(:finished?)
      error_message = "This competition has ended"
      self.errors.add(:competition, error_message)
    end
  end

  def athlete_can_attempt
    if competition && athlete
      number_of_attempts = competition.results.from_athlete(athlete).count
      max_attempts = competition.max_attempts

      if number_of_attempts >= max_attempts
        error_message = "The maximum number of attempts was reached"
        self.errors.add(:athlete, error_message)
      end
    end
  end
end

class Competition < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :athletes, -> { distinct }, through: :results

  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false }

  validates :unit,
    presence: true

  validates :max_attempts,
    presence: true,
    numericality: { only_integer: true, greater_than: 0 }

  validates :win_definition,
    presence: true,
    inclusion: { in: %w(min max),
    message: "%{value} need to be min or max" }

  

  def define_finish
    update finished: true
  end

  def define_rank
    results
      .group(:athlete_id)
      .order(value: order_results_by_win_definition)
  end

  private

  def order_results_by_win_definition
    win_definition == "max" ? "desc" : "asc"
  end
end

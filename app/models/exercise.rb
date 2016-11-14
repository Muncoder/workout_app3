class Exercise < ActiveRecord::Base

	validates :duration_in_min, presence: true
	validates :workout, presence: true
	validates :workout_date, presence: true

end
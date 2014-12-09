class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
		validates :title, presence: true,
	                    length: { minimum: 5 }
	belongs_to :user
	after_initialize :default_values

	def default_values
		self.number_of_comments ||= 0
	end
end

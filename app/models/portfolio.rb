class Portfolio < ApplicationRecord

	has_many :technologies

	accepts_nested_attributes_for :technologies, 
								  allow_destroy: true,
	                              reject_if: lambda {|attrs| attrs['name'].blank?}


	validates_presence_of :title, :body

	has_one_attached :main_image
	has_one_attached :thumb_image

	def self.angular
	  where(subtitle: 'Angular')
	end 

	def self.by_position
	  order("position ASC")
	end 

	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}

	

end

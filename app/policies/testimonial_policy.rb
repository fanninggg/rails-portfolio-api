class TestimonialPolicy < ApplicationPolicy
	def clients?
		true
	end

	def students?
		true
	end

	def colleagues?
		true
	end
end

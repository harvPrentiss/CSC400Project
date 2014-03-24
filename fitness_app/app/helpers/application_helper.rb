module ApplicationHelper

	# Returns the full title on a per page basis
	def full_title(page_title)
		base_title = "Pulse Fitness"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def time_ago time
    	time_ago_in_words(time, include_seconds: true).gsub(/about|less than|almost|over/, '')
	end
end

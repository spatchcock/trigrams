module Trigram

	class Excerpt

		attr_accessor :result

		def initialize(training_set)
			@training_set = training_set
		end

		def generate(word_count)
			bootstrap_result
	    while @result.size < (word_count) do
	      add_word
	    end
	    finalize_result

	    return @result
		end

		def text
			@result.join(" ").gsub(/(\w+)(\s)(\.|,|\:|;)/, "\\1\\3" )
		end

		protected

		def bootstrap_result
	    @result =  []
	    @result += @training_set.random_duple
	    @result.first.capitalize!
		end

		def finalize_result
			until @result.last =~ /\.$/
	      add_word    
			end
		end

		def add_word
	    # Match current terminal duple with training set word map
	    word_choices = current_terminal_choices

	    if word_choices.nil?
	    	# If no match on current terminal duple, try matching either of the tokens

	    	alternative_matching_duples = single_matching_current_terminal_choices
	    	word_choices = alternative_matching_duples[rand(alternative_matching_duples.size)].last
	    end

	    @result << word_choices[rand(word_choices.size)]
		end

		# Get current terminal duple (pair of tokens)
		def current_terminal_duple 
			@result[-2,2]
		end

	  # Match current terminal duple to training set word map
		def current_terminal_choices
			@training_set.word_map[current_terminal_duple.join(" ")] 
		end

		def single_matching_current_terminal_choices
	    single_token_duple_matches(*current_terminal_duple)
		end

		def single_token_duple_matches(first_token, second_token)
	    matching_duples = @training_set.word_map.find_all do |k,v| 
	  		first, last = k.split(" ")
	  		(first != first_token && last == second_token) || 
	  		(first == first_token && last != second_token)
	  	end
		end
	  
	end
end
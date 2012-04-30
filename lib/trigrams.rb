[ 
	'trigrams/core_ext/string', 
	'trigrams/training_set',
	'trigrams/excerpt'
	
].each do |path|
	require File.join(File.dirname(__FILE__), path)
end
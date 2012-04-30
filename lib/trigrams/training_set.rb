module Trigram

  class TrainingSet

    attr_accessor :source, :tokens, :word_map

    def initialize(file)
      @source   = File.read(file)
      @word_map = {}
      @tokens   = []
      generate_word_map
    end

    def random_duple
      word_map.keys[rand(word_map.size)].split(" ")
    end

    protected

    def generate_word_map
      tokens = tokenize_source

      until tokens.size == 0 do
        duple = tokens[0,2].join(" ")

        if @word_map[duple].nil?
          @word_map[duple] = [tokens[2]]
        else
          @word_map[duple] << tokens[2]
        end

        tokens.shift
      end
    end

    def tokenize_source
      @tokens = @source.split(/(\s+|\.|,|\:|;)/)
      @tokens.map!      { |token| token.strip_quotes.strip_parentheses.strip_carriage_return.strip_new_line }
      @tokens.delete_if { |token| token =~ /^\s+$/ || token.empty? }
      @tokens
    end

  end
end
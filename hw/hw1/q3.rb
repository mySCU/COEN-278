class Compress
    attr_accessor :seq, :words

    def initialize(str)
        @words_hash = {}
        @seq        = []
        @words      = []

        str.split(/\W/).each {|w| 
            if not @words_hash[w]
                @words_hash[w] = @words_hash.size
                @words << w         # ordered, no need to worry unstable index
            end
            @seq << @words_hash[w]
        }
        # @words = @words_hash.keys   # how to sort hash key by its value?
    end

end
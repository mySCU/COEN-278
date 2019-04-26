class String
    def count_word(word="")
        
        # statistic on all words
        pool = {}
        self.split(/\W+/).each { |w|    # split from all "not word" chars
            if pool[w]
                pool[w] += 1
            else
                pool[w] = 1
            end
        }

        # return according to word
        if word != ""
            return pool[word] || 0
        else
            return pool
        end

    end
end
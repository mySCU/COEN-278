class Hash
    def merge(hash2, &block)
        tmp = self.clone   # copy hash1

        hash2.each {|key, value|
            if tmp[key]
                if block_given?                             # check block
                    tmp[key] = yield(key, self[key], value) # get block return value
                else
                    tmp[key]= value
                end                    
            else
                tmp[key] = value
            end
        }
        return tmp
    end

    def merge!(hash2, &block)       # dangerous version
        self.merge(hash2, &block).each {|key, val| self[key] = val}
    end
end
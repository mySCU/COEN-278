def puts_advisor(file_name)
    File.readlines(file_name).each { |line|   # open file, default read only, close automatically
        if (line =~ /^ADVISOR.*/) != nil
            puts "#{line}"
        end
    }    
end
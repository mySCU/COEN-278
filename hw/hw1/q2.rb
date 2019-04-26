class Search
    def search_students(students, filter)
        newStudents = students.select {|hash|
            filter.all? {|key, value|
                value == hash[key]
            }
        }

        puts "First Name\tLast Name\tPhone\n\n"
        newStudents.each {|hash|
            puts "#{hash[:firstname]}\t\t"\
                 "#{hash[:lastname]}\t"\
                 "#{hash[:phonenumber]}\t"
        }
    end
end
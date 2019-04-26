class Webpage
    attr_accessor :template

    def initialize(str)
        @template = str
    end
    
    def filter
        newStr = ""
        @template.split("\n").each {|line|
            if !(line =~ /<%.*/ or line == "")
                newStr << line + "\n"
            end
        }
        return newStr
    end
end
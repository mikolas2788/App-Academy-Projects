class Array

    def my_each(&prc)
        
        i = 0 
        while i < self.length
            ele = self[i]
            prc.call(ele)
            i += 1
        end 
        return self
    end 

    def my_select(&prc)
        selected = []

        self.my_each { |ele| selected << ele if prc.call(ele) }

        selected
    end 

    def my_reject(&prc)
        selected = []

        self.my_each { |ele| selected << ele if !prc.call(ele) }

        selected
    end 

    def my_any?(&prc)

        self.my_each do |ele| 
            if prc.call(ele)
                return true
            end 
        end 

        false
    end 

    def my_flatten
        
        flattened = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                flattened += ele.flatten 
            else 
                flattened << ele
            end 
        end 

        flattened 
    end 

    def 
end 

# https://www.hackerrank.com/challenges/truck-tour/problem

def truckTour(petrolpumps)
    previous_petrol = 0
    index = 0
    petrolpumps.each_with_index do |k, i|

        petrol_remaining = k[0] - k[1]
        if (petrol_remaining + previous_petrol) < 0
            previous_petrol = 0
            index = nil
        else
            if index == nil
                index = i
            end
            previous_petrol = petrol_remaining + previous_petrol
        end
    end
    return index
end
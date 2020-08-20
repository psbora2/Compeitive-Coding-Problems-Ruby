
strArr = ["baseball", "a,all,b,ball,bas,base,cat,code,d,e,quit,z"]

def ArrayChallenge(strArr)

  word = strArr[0]
  remaing_string = strArr[1].split(',')
  k = "not possible"
  remaing_string.each do |el|
    puts el
    if word.include?(el)
      remaing_string.each do |f|
        if word.include?(f)
          if word == (f+el)
            k = "#{f},#{el}"
            break
          elsif word == (el+f)
            k = "#{el},#{f}"
            break
          end
        end
      end
    end
  end
  return k
end

ArrayChallenge(strArr)
module FunWithStrings
  def palindrome?
    # your code here
    temp = self.downcase.gsub(/\W/,'')
    return temp == temp.reverse
  end
  def count_words
    # your code here 
    hash = {}
    temp = self.downcase.gsub(/\W/,' '=>' ')
    temp.split(' ').each do |word| 
       if hash.has_key?(word) then hash[word] += 1
                              else hash[word] = 1
       end
    end
    return hash
  end
  def anagram_groups
    # your code here
    hash = {}
    self.split(' ').each do |word|
      if hash.has_key?(word.chars.sort) then hash[word.chars.sort] += [word]
                                        else hash[word.chars.sort] = [word]
      end
    end
    return hash.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

=begin
aaa = ['redivider','abracadabra','ReDivider','A man, a plan, a canal -- Panama',"Madam, I'm Adam!"]
aaa.each {|f| puts f.palindrome?}
bbb = ['now is the time','Doo bee doo bee doo','A man, a plan, a canal -- Panama!','',"  toucan","four   four  \n four \t four!"]
bbb.each {|f| puts f.count_words}
=end

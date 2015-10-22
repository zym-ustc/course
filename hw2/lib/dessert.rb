class Dessert
  def initialize(name, calories)
    # your code here
    @name = name
    @calories = calories
  end
  def name
    @name
  end
  def calories
    @calories
  end
  def name=(name)
    @name = name
  end
  def calories=(calories)
    @calories = calories 
  end

  def healthy?
    # your code here
    @calories < 200
  end
  def delicious?
    # your code here
    true
  end
end

class JellyBean < Dessert
  def initialize(flavor)
    # your code here
    @name = flavor + " jelly bean"
    @calories = 5
    @flavor = flavor
  end
  def flavor
    @flavor
  end
  def flavor=(flavor)
    @flavor = flavor
  end
  def delicious?
    if @flavor.eql?("licorice") then return false
                                else return true
    end 
  end
end

=begin
subject = Dessert.new('cake',400)
puts subject.calories
puts subject.name
puts subject.delicious?
puts subject.healthy?
subject = Dessert.new('apple',75)
puts subject.delicious?
puts subject.healthy?
subject = Dessert.new('xxx',0)
subject.calories = 80
puts subject.calories
subject.name = 'ice cream'
puts subject.name

subject = JellyBean.new('vanilla')
puts subject.calories
puts subject.name
puts subject.delicious?


subject = JellyBean.new('licorice')
puts subject.delicious?i
=end

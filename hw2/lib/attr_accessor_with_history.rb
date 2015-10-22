class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
        def #{attr_name}=(value)      
        if #{attr_name} == nil then       
          @#{(attr_name + "_history")} = []
        end

        @#{(attr_name + "_history")}.push(#{attr_name})
        @#{attr_name} = value
        end
    }
  end
end


=begin
class Foo
  attr_accessor_with_history :bar
end

a=Foo.new
print a.bar_history==nil
puts
a.bar=1
print a.bar_history
puts
a.bar=2
print a.bar_history
puts
=end

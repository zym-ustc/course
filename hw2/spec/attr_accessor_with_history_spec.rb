require 'attr_accessor_with_history'
#require 'byebug'

class TestClass1
  attr_accessor_with_history :foo
end
class TestClass2
  attr_accessor_with_history 'foo'
end

describe '#attr_accessor_with_history' do
  shared_examples 'all cases' do
    it 'should define getter and setter [5 points]' do
      @subject.foo = 'xyz'
      expect(@subject.foo).to be == 'xyz'
    end
    it 'setter should return value set to [5 points]' do
      expect(@subject.foo = 'xyz').to be == 'xyz'
    end
    it 'should work if getter used first [10 points]' do
      expect(@subject.foo_history).to be_nil
    end
    it 'should work if setter used first [20 points]' do
      @subject.foo = 'x'
      @subject.foo = 'y'
      expect(@subject.foo_history).to be == [nil, 'x']
    end
    it 'should remember values [10 points]' do
      @subject.foo
      @subject.foo = 3
      @subject.foo = 'x'
      expect(@subject.foo_history).to be == [nil, 3]
    end
  end
  describe 'when a symbol is passed [10 points]' do
    before(:each) { @subject = TestClass1.new }
    include_examples 'all cases'
  end
  describe 'when a string is passed [10 points]' do
    before(:each) { @subject = TestClass2.new }
    include_examples 'all cases'
  end
  it 'should remember history separately for each instance [30 points]' do
    obj1 = TestClass1.new
    obj2 = TestClass1.new
    obj1.foo = :x ; obj1.foo = :y
    obj2.foo = 1  ; obj2.foo = 2
    expect(obj1.foo_history).to be == [nil, :x]
    expect(obj2.foo_history).to be == [nil, 1]
  end
end

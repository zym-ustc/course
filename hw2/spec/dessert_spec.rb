require 'dessert.rb'
#require 'byebug'

describe Dessert do
  describe 'cake' do
    before :each do
      @subject = Dessert.new('cake', 400)
    end
    it 'should have 400 calories [10 points]' do
      expect(@subject.calories).to be == 400
    end
    it 'should be named cake [10 points]' do
      expect(@subject.name).to be == 'cake'
    end
    it 'should be delicious [10 points]' do
      expect(@subject).to be_delicious
    end
    it 'should not be healthy [10 points]' do
      expect(@subject).not_to be_healthy
    end
  end
  describe 'apple' do
    before :each do
      @subject = Dessert.new('apple', 75)
    end
    it 'should be delicious [10 points]' do
      expect(@subject).to be_delicious
    end
    it 'should be healthy [10 points]' do
      expect(@subject).to be_healthy
    end
  end
  describe 'can set' do
    before(:each) { @dessert = Dessert.new('xxx', 0) }
    it 'calories [10 points]' do
      @dessert.calories = 80
      expect(@dessert.calories).to be == 80
    end
    it 'name [10 points]' do
      @dessert.name = 'ice cream'
      expect(@dessert.name).to be == 'ice cream'
    end
  end
end

describe JellyBean do
  describe 'when non-licorice' do
    before :each do
      @subject = JellyBean.new('vanilla')
    end
    it 'should contain 5 calories [5 points]' do
      expect(@subject.calories).to be == 5
    end
    it 'should be named vanilla jelly bean [5 points]' do
      expect(@subject.name).to match(/vanilla jelly bean/i)
    end
    it 'should be delicious [5 points]' do
      expect(@subject).to be_delicious
    end
  end
  describe 'when licorice' do
    before :each do
      @subject = JellyBean.new('licorice')
    end
    it 'should not be delicious [5 points]' do
      expect(@subject).not_to be_delicious
    end
  end
end

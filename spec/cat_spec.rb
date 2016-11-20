require_relative './spec_helper'
require_relative '../lib/cat.rb'


describe "Cat Creator" do
  describe '#initialize with a hash' do
    it 'accepts a scraped hash for the cat object' do
      cat = Cat.new({name: "Gus", breed: "perfect", gender: "male", age: "old", shelter: "adopted", bio: "Spoiled rotten by his mother"})
      expect(cat.name).to eq("Gus")
      expect(cat.breed).to eq("perfect")
    end
  end


  describe '.all' do
    it 'returns the class variable @@all' do
      Cat.class_variable_set(:@@all, [])

      expect(Cat.all).to match_array([])
    end
  end

  describe '.destroy_all' do
    it 'resets the @@all class variable to an empty array' do
      Cat.class_variable_set(:@@all, ["cat"])

      Cat.destroy_all
      expect(Cat.all).to match_array([])
    end
  end


end

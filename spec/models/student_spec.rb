require 'rails_helper'

RSpec.describe Student, type: :model do
  let!(:malfoy){Student.create!(name: "Malfoy Draco", age: 12, house: "Slytherin")}
  let!(:harry){Student.create!(name: "Harry Potter", age: 12, house: "Gryffindor")}
  let!(:cedric){Student.create!(name: "Cedric Diggory", age: 15, house: "Hufflepuff")}

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    it '#average_age' do
      expect(Student.average_age).to eq 13
    end
  end

end

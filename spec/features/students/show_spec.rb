require 'rails_helper'

RSpec.describe 'students' do
  let!(:malfoy){Student.create!(name: "Malfoy Draco", age: 12, house: "Slytherin")}
  let!(:harry){Student.create!(name: "Harry Potter", age: 12, house: "Gryffindor")}
  let!(:cedric){Student.create!(name: "Cedric Diggory", age: 15, house: "Hufflepuff")}
  let!(:potions){Course.create!(name: "Potions")}
  let!(:spells){Course.create!(name: "Spells")}
  let!(:student_course1){StudentCourse.create!(student_id: harry.id, course_id: potions.id)}
  let!(:student_course2){StudentCourse.create!(student_id: harry.id, course_id: spells.id)}
  describe 'when a user visits the show page' do
    it "they will see the courses for a given student" do
      visit "/students/#{harry.id}"

      expect(page).to have_content(harry.name)
      expect(page).to have_content(potions.name)
      expect(page).to have_content(spells.name)
    end
  end
end

require 'rails_helper'

RSpec.describe 'the courses' do
  let!(:malfoy){Student.create!(name: "Draco Malfoy", age: 12, house: "Slytherin")}
  let!(:harry){Student.create!(name: "Harry Potter", age: 12, house: "Gryffindor")}
  let!(:cedric){Student.create!(name: "Cedric Diggory", age: 15, house: "Hufflepuff")}
  let!(:potions){Course.create!(name: "Potions")}
  let!(:spells){Course.create!(name: "Spells")}
  let!(:harry_course1){StudentCourse.create!(student_id: harry.id, course_id: potions.id)}
  let!(:harry_course2){StudentCourse.create!(student_id: harry.id, course_id: spells.id)}
  let!(:cedric_course1){StudentCourse.create!(student_id: cedric.id, course_id: spells.id)}
  let!(:malfoy_course1){StudentCourse.create!(student_id: malfoy.id, course_id: spells.id)}
  let!(:malfoy_course2){StudentCourse.create!(student_id: malfoy.id, course_id: potions.id)}
  describe 'when a user visits the index page' do
    it "they will see the courses along with the number of students in each course" do
      visit "/courses"

      expect(page).to have_content(potions.name)
      expect(page).to have_content("2")
      expect(page).to have_content(spells.name)
      expect(page).to have_content("3")

    end
  end
end

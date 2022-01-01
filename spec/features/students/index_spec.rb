require 'rails_helper'

RSpec.describe 'the index page' do
  let!(:malfoy){Student.create!(name: "Malfoy Draco", age: 12, house: "Slytherin")}
  let!(:harry){Student.create!(name: "Harry Potter", age: 12, house: "Gryffindor")}
  let!(:cedric){Student.create!(name: "Cedric Diggory", age: 15, house: "Hufflepuff")}
  describe 'when a user visits the index page' do
    it "they will see the attributes of each student" do
      visit '/students'
      expect(page).to have_content(malfoy.name)
      expect(page).to have_content(malfoy.age)
      expect(page).to have_content(malfoy.house)

      expect(page).to have_content(cedric.name)
      expect(page).to have_content(cedric.age)
      expect(page).to have_content(cedric.house)
    end

    it "returns the average age of the students" do
      visit '/students'
      expect(page).to have_content("13")
      expect("Average Age of Students").to appear_before("13")

    end
  end
end

class Student < ApplicationRecord
  has_many  :student_courses
  has_many :courses, through: :student_courses
  validates :name, presence: true
  validates :age, presence: true
  validates :house, presence: true

  def self.average_age
    students = Student.all
    students.sum(:age).to_f / students.count
  end
end

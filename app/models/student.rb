# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(input)
    # if input empty string return all students
    if input.blank?
      Student.all
    else
      # otherwise return all students that match input
      Student.all.select do |student|
        student if !!student.name.downcase.match(input)
      end
    end
  end

end

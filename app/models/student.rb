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

  def self.search(name)
    if name.size == 0
      return self.all
    else
      ary = []
      self.all.each do |student|
        if student != nil
          student.name[0] = student.name[0].downcase
          if student.name.include?(name)
            student.name = student.name.capitalize
            ary << student
          end
        end
      end
      return ary
    end
  end



end

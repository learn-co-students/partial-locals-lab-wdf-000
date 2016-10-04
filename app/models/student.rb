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

  def self.search(x)
    array = []
    if x.empty?
      Student.all
    else
      Student.all.each do |s|
        # binding.pry
        if s.name.downcase.include?(x)
          array << s
        end
      end
      # binding.pry
      array
    end
  end

end

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
    if name.empty?
      self.all
    else
      names = self.all.map{|student| student.name.downcase}.grep(/#{name}/)
      names.collect do |name|
        self.find_by(name: name.capitalize)
      end
    end
  end

end

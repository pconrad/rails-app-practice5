require 'roo'

class Student < ApplicationRecord

    validates :email, :presence => true, :uniqueness => true
    validates :id_number, :presence => true, :uniqueness => true


	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (3..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    permNum = row["Perm #"]
	 
	    student = Student.find_by(id_number: permNum) || new

	    student.id_number = permNum
	    student.fname = row["Student First Middle"]
	    student.lname = row["Student Last"]
	    student.email = row["Email"]
	    student.save!
	  end
	end

	def self.open_spreadsheet(file)
	  ext = File.extname(file.original_filename)
	  Roo::Spreadsheet.open(file.path, extension: ext)
	end



end

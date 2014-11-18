### Simple ruby script that takes and excel worksheet and turns it into SQL code ###
###Author: Tyson Sorensen



#this program requires the spreadsheet ruby gem - https://rubygems.org/gems/spreadsheet  
require 'spreadsheet'  

                      
array = Array.new
counter = 0
spreadsheetName = 'your_file.xls'  #name of your spreadsheet file
newFile = 'output.txt' #your destination file for the SQL output
sheetName = 'Sheet1' #name of the excel sheet inside the spreadsheet file


Spreadsheet.open spreadsheetName do |sheet|
	puts "Working..." 
	
	sheet.worksheet(sheetName).each do |row|        
		
		#to SQL insert statements:
		entry = "insert into TABLE_NAME (column1, column2, column3) values('#{row[0]}', #{row[1].to_f}, #{row[2].to_i});"   #cast cell data as needed (.to_i, .to_f)

		File.open(newFile, 'a') do |file|
			file.puts entry		
		end
		counter+=1
	end
	
	puts counter.to_s + " rows exported."
end

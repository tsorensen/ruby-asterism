### Simple ruby script that takes and excel worksheet and turns it into SQL code ###
###Author: Tyson Sorensen



#this program requires the spreadsheet ruby gem - https://rubygems.org/gems/spreadsheet  
require 'spreadsheet'  

                      
array = Array.new
counter = 0
spreadsheetName = 'excel_data.xls'  #name of your spreadsheet file
newFile = 'output.txt' #your destination file for the SQL output


Spreadsheet.open spreadsheetName do |sheet|
	puts "Working..." 
	
	sheet.worksheet('Sheet1').each do |row|        
		
		#to SQL insert statements:
		entry = "insert into table_name (col1_name, col2_name, col3_name, col4_name, col5_name) values('#{row[0]}', #{row[1].to_f}, #{row[2].to_i}, #{row[3].to_i}, '#{row[4]}');"   #cast cell data as needed (.to_i, .to_f)

		File.open(newFile, 'a') do |file|
			file.puts entry		
		end
		counter+=1
	end
	
	puts counter.to_s + " rows exported."
end
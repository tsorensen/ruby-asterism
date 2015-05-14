## Create Music Playlist ##


def sort some_array #wrapper
	recursive_shuffle some_array, []
end

def recursive_shuffle unshuffled_array, shuffled_array
	unshuffled_array.pop
	if unshuffled_array.length == 0
		puts "Couldn't find any files, something went wrong...try again."
		get_ext
	end
	while unshuffled_array.length > 0
		if unshuffled_array.length == 1
			shuffled_array.push unshuffled_array[0]
			unshuffled_array.pop
		else
		num_words = unshuffled_array.length
		shuffle = rand(num_words)
		position = 1
		word = unshuffled_array[shuffle]
		num_words = num_words - 1
		position += 1
		shuffled_array.push word
		unshuffled_array.delete(word)
		end
	end
	puts
	puts "All done!"
	puts "Please name your playlist!"
	name = gets.chomp
	playlist = File.new("#{name}.m3u", "w")
	playlist.puts(shuffled_array)
	puts "Your #{name} playlist has been created! Look in your music folder!"
	
end

def get_dir
	puts
	puts
	puts "Please enter the parent directory where your music is located,"
	puts "or type 'default' to pull from 'My Music'."
	puts "(ex: C:\\Users\\tysons\\Music) or type 'default'"
	@directory = gets.chomp
	if Dir.exists?("#{@directory}")
		Dir.chdir("#{@directory}")
	elsif @directory.downcase == "default"
		@directory = 'C:\Users\tysons\Music'
		puts "Ok! We will use the default folder, 'My Music'."
		puts
	else
		puts "Oops!  We couldn't find that directory."
		puts "Try again or put 'default' to use My Music."
		get_dir
	end
	get_ext
end

def get_ext
	puts
	puts
	puts "What type of files are you looking for? Ex: mp3, wma, etc."
	puts "Please enter the file extension you want to look for."
	@filetype1 = gets.chomp
	unshuffled_songs = Dir["**/*.{#{@filetype1}}"]
	puts "Perfect!  Let's get shufflin'"
	sort unshuffled_songs
end

line = 50
puts "Welcome to  playlist builder!".center(line)
puts "Lets get started.".center(line)
puts
get_dir










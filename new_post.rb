require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/link'
require_relative 'lib/task'


puts 'Привет! Я твой блокнот.'
puts 'Что хотите записать?'

choices = Post.post_types

choice = nil
until ('1'..choices.size.to_s).to_a.include?(choice)
  choices.values.each.with_index(1) do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = STDIN.gets.strip
end

type = choices.keys[choice.to_i - 1]

entry = Post.create(type)

entry.read_from_consol

rowid = entry.save_to_db

puts
puts "Ура, запись сохранена! (rowid = #{rowid})"

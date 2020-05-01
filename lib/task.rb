require 'date'

class Task < Post

  def initialize
    super

    @due_date = Time.now
  end

  def read_from_consol
    puts 'Что надо сделать?:'
    @text = STDIN.gets.strip

    puts "К какому числу? Укажите дату в формате ДД.ММ.ГГГГ (например - 22.03.2020):"
    input = STDIN.gets.strip

    @due_date = Date.parse(input)
  end

  def to_strings
    deadline = "Крайний срок: #{@due_date.strftime('%Y.%m.%d')}"
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\n"

    [time_string, @text, deadline]
  end

  def to_db_hash
    super.merge(text: @text, due_date: @due_date.strftime("%Y.%m.%d"))
  end

  def load_data(data_hash)
    super

    @text = data_hash['text']
    @due_date = Date.parse(data_hash['due_date'])
  end
end

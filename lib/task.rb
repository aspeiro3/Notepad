require 'date' # Подключаем встроеную библиотеку ruby для преобразования стоки в класс Data

class Task < Post

  def initialize
    super # вызываем конструктор родителя

    @due_data = Time.now
  end

  def read_from_consol
    puts 'Что надо сделать?:'
    @text = STDIN.gets.strip

    puts "К какому числу? Укажите дату в формате ДД.ММ.ГГГГ (например - 22.03.2020):"
    input = STDIN.gets.strip

    @due_data = Date.parse(input) # Метод '.parse' преобразовует строку 'inpud' в дату
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r"

    deadline = "Крайний срок: #{@due_data}"

    [deadline, @text, time_string]
  end
end

class Link < Post

  def initialize
    super # вызываем конструктор родителя

    @url = ''
  end

  def read_from_consol
    puts 'Адрес ссылки:'
    @url = STDIN.gets.strip

    puts 'Что за ссылка?:'
    @text = STDIN.gets.strip
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r"

    [@url, @text, time_string]
  end
end

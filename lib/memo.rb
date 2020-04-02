class Memo < Post

  def read_from_consol
    puts "Новая заметка (всё что напишите до слова \"end\")"

    @text = []
    line = nil

    while line != 'end'
      line = STDIN.gets.strip
      @text << line
    end

    @text.pop # Удаляет последнюю строчку из массива
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r"

    @text.unshift(time_string) # Метод '.unshift' добавляет в начало массива строку 'time_string'
  end
end

class Memo < Post

  def read_from_consol
    puts "Новая заметка (всё что напишите до слова 'end')"

    @text = []
    line = nil

    while line != 'end'
      line = STDIN.gets.strip
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\n"

    @text.unshift(time_string)
  end

  def to_db_hash
    super.merge(text: @text.join("\n").gsub("\n", '; '))
  end

  def load_data(data_hash)
    super

    @text = data_hash['text'].split('; ')
  end
end

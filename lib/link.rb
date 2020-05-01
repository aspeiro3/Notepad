class Link < Post

  def initialize
    super

    @url = ''
  end

  def read_from_consol
    puts 'Адрес ссылки:'
    @url = STDIN.gets.strip

    puts 'Что за ссылка?:'
    @text = STDIN.gets.strip
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\n"

    [time_string, @url, @text]
  end

  def to_db_hash
    super.merge(url: @url, description: @text)
  end

  def load_data(data_hash)
    super

    @url = data_hash['url']
    @text = data_hash['description']
  end
end

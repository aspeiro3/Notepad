class Post

  def self.post_types # Объявление статического метода класса
    [Memo, Task, Link] # Будет возвращать массив всех дочерних классов
  end

  def self.create(type_index)
    post_types[type_index].new # Вернет по индексу один из элементов массива
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console
    #todo
  end

  def to_strings
    #todo
  end

  def save
    file = File.new(file_path, 'w:UTF-8')

    to_strings.each do |item|
      file.puts(item)
    end

    file.close
  end

  def file_path
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

    current_path = "#{__dir__}/../data/#{file_name}"
  end
end

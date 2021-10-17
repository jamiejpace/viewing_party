class Cast
  attr_reader :name,
              :role

  def initialize(data)
    @name = data[:name]
    @role = data[:character]
  end
end

class School
  VERSION = 1
  attr_reader :db

  def initialize
    @db = Hash.new { |hash, key| hash[key] = [] }
  end

  def to_h
    sort_keys
  end

  def add(name, grade)
    db[grade] << name
    db[grade].sort!
  end

  def grade(grade)
    db[grade]
  end

  private
    def sort_keys
      Hash[db.sort]
    end
end
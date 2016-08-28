class Bob
  def hey(greeting)
    {
      statement: 'Whatever.',
      shouting: 'Whoa, chill out!',
      question: 'Sure.',
      empty: 'Fine. Be that way!',
    }[greeting_type(greeting)]
  end

  private
    def greeting_type(greeting)
      case
      when shouting?(greeting)
        :shouting
      when asking?(greeting)
        :question
      when silent?(greeting)
        :empty
      else
        :statement
      end
    end

    def shouting?(phrase)
      phrase =~ /[a-zA-Z]/ && phrase == phrase.upcase
    end

    def asking?(phrase)
      phrase[-1] == "?"
    end

    def silent?(phrase)
      phrase.strip.empty?
    end
end
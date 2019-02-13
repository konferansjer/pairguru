class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    @title = record.title
    @matching_brackets = { "{" => "}", "(" => ")", "[" => "]" }
    @allow_empty = options[:allow_empty] || false
    record.errors.add(:title, "Invalid title") if !valid?
  end

  private

  def valid?
    opening_brackets_occurences = []
    closing_brackets = @matching_brackets.values
    return false if !@allow_empty && have_empty_brackets?

    @title.split("").each do |c|
      opening_brackets_occurences.push(c) if @matching_brackets.key?(c)
      next unless closing_brackets.include?(c)
      last_opening_bracket = opening_brackets_occurences.pop
      return false unless brackets_match?(last_opening_bracket, c)
    end

    opening_brackets_occurences.empty?
  end

  def have_empty_brackets?
    /\(\)|\[\]|\{\}/.match? @title
  end

  def brackets_match?(opening, closing)
    opening && @matching_brackets[opening] == closing
  end
end

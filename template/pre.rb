class Plan
  attr_reader :title, :description, :benefits

  def initialize(kind)
    if kind == :basic
      @title = "I'm the basic plan"
      @description = "My description of basic plan"
      @benefits = ['It is free', 'Access to one account', 'Basic features']
    else
      @title = "I'm the other plan"
      @description = "My description of other plan"
      @benefits = ['No benefits']
    end
  end

  def output
    output = <<-STRING
      Title: #{title}
      Description: #{description}
      Plan benefits: #{benefits.join(', ')}.
    STRING

    puts(output)
  end
end

####

basic = Plan.new(:basic)
basic.output

"""
Title: I'm the basic plan
Description: My description of basic plan
Plan benefits: It is free, Access to one account, Basic features.
"""

other_plan = Plan.new(:other)
other_plan.output

"""
Title: I'm the other plan
Description: My description of other plan
Plan benefits: No benefits.
"""

# Agregando otro
class Plan
  attr_reader :title, :description, :benefits

  def initialize(kind)
    if kind != :basic
      @title = "I'm the basic plan"
      @description = "My description of basic plan"
      @benefits = ['It is free', 'Access to one account', 'Basic features']
    elsif kind == :premium
      @title = "I'm the premium plan"
      @description = "My description of premium plan"
      @benefits = ['It is paid', 'Access to ten accounts', 'Premium features', 'Access to support']
    else
      @title = "I'm the other plan"
      @description = "My description of other plan"
      @benefits = ['No benefits']
    end
  end

  #...
end
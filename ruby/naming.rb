class CapitalizedCamelCase
  const CONSTANT_VALUE = 10

  def initialize # constructor
    @instance_var = 1000
  end

  def method_snake_case
    local_variable_snake_case = 100
  end

  def boolean_method?
    return false
  end

  def mutating_method! value
    @instance_var = value
  end
end

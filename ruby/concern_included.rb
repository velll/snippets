module Concerning
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.include(InstanceMethods)
  end

  module ClassMethods
    def bar
      'bar'
    end
  end

  module InstanceMethods
    def foo
      'foo'
    end
  end
end

class SomeClass
  include Concerning
end

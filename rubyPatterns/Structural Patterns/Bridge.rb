# Мост — это структурный паттерн, 
# который разделяет бизнес-логику или большой класс на несколько отдельных иерархий, 
# которые потом можно развивать отдельно друг от друга

# Абстракция устанавливает интерфейс для «управляющей» части двух иерархий
# классов. Она содержит ссылку на объект из иерархии Реализации и делегирует ему
# всю настоящую работу.
class Abstraction
  def initialize(implementation)
    @implementation = implementation
  end

  def operation
    "Abstraction: Base operation with:\n"\
    "#{@implementation.operation_implementation}"
  end
end

class ExtendedAbstraction < Abstraction
  def operation
    "ExtendedAbstraction: Extended operation with:\n"\
    "#{@implementation.operation_implementation}"
  end
end

# Реализация устанавливает интерфейс для всех классов реализации. Он не должен
# соответствовать интерфейсу Абстракции. На практике оба интерфейса могут быть
# совершенно разными. Как правило, интерфейс Реализации предоставляет только
# примитивные операции, в то время как Абстракция определяет операции более
# высокого уровня, основанные на этих примитивах.
class Implementation
  def operation_implementation
    raise NotImplementedError, "#{self.class} has no implemented method '#{__method__}'"
  end
end

class ConcreteImplementationA < Implementation
  def operation_implementation
    'ConcreteImplementationA: Here\'s the result on the platform A.'
  end
end

class ConcreteImplementationB < Implementation
  def operation_implementation
    'ConcreteImplementationB: Here\'s the result on the platform B.'
  end
end

def client_code(abstraction)
  print abstraction.operation
end

implementation = ConcreteImplementationA.new
abstraction = Abstraction.new(implementation)
client_code(abstraction)

puts "\n\n"

implementation = ConcreteImplementationB.new
abstraction = ExtendedAbstraction.new(implementation)
client_code(abstraction)
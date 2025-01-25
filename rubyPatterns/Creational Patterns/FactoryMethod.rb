# Фабричный метод — это порождающий паттерн проектирования, 
# который решает проблему создания различных продуктов, без указания конкретных классов продуктов.

# Признаки применения паттерна: 
# Фабричный метод можно определить по создающим методам, 
# которые возвращают объекты продуктов через абстрактные типы или интерфейсы. 
# Это позволяет переопределять типы создаваемых продуктов в подклассах.

# Класс Создатель объявляет фабричный метод, который должен возвращать объект
# класса Продукт. Подклассы Создателя обычно предоставляют реализацию этого
# метода.
#
# @abstract

# Класс Создатель объявляет фабричный метод, который должен возвращать объект
# класса Продукт. Подклассы Создателя обычно предоставляют реализацию этого
# метода.
#
# @abstract
class Creator
  # Обратите внимание, что Создатель может также обеспечить реализацию
  # фабричного метода по умолчанию.
  #
  # @abstract
  def factory_method
    raise NotImplementError, "#{self.class} has no implemented method '#{__method__}'"
  end

  # Также заметьте, что, несмотря на название, основная обязанность Создателя не
  # заключается в создании продуктов. Обычно он содержит некоторую базовую
  # бизнес-логику, которая основана на объектах Продуктов, возвращаемых
  # фабричным методом. Подклассы могут косвенно изменять эту бизнес-логику,
  # переопределяя фабричный метод и возвращая из него другой тип продукта.
  #
  # @return [String]
  def some_operation
    product = factory_method

    "Creator: The same creator's code has just worked with #{product.operation}"
  end
end

# Конкретные Создатели переопределяют фабричный метод для того, чтобы изменить
# тип результирующего продукта.
class ConcreteCreator1 < Creator
  def factory_method
    ConcreteProduct1.new
  end
end

class ConcreteCreator2 < Creator
  def factory_method
    ConcreteProduct2.new
  end
end

# Интерфейс Продукта объявляет операции, которые должны выполнять все конкретные
# продукты.
#
# @abstract
class Product 
  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteProduct1 < Product
  def operation
    '{result of the concrete product 1}'
  end
end

class ConcreteProduct2 < Product
  def operation
    '{result of the concrete product 2}'
  end
end

# Клиентский код работает с экземпляром конкретного создателя, хотя и через его
# базовый интерфейс. Пока клиент продолжает работать с создателем через базовый
# интерфейс, вы можете передать ему любой подкласс создателя.
#
# @param [Creator] creator
def client_code(creator)
  print "Client: I'm not aware of the creator's class, but it still works.\n"\
        "#{creator.some_operation}"
end

puts 'App: Launched with the ConcreteCreator1.'
client_code(ConcreteCreator1.new)
puts "\n\n"

puts 'App: Launched with the ConcreteCreator2.'
client_code(ConcreteCreator2.new)
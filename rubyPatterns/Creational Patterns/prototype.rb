# Прототип — это порождающий паттерн, который позволяет копировать
# объекты любой сложности без привязки к их конкретным классам.

# Все классы—Прототипы имеют общий интерфейс. 
# Поэтому вы можете копировать объекты, не обращая внимания на их конкретные типы и всегда быть уверены, что получите точную копию. 
# Клонирование совершается самим объектом-прототипом, что позволяет ему скопировать значения всех полей, даже приватных.

# Применимость: Паттерн Прототип реализован в базовой библиотеке Ruby посредством методов dup или clone.

# Признаки применения паттерна: Прототип легко определяется в коде по наличию методов clone, copy и прочих.

class Prototype
  attr_accessor :primitive, :component, :circular_reference

  def initialize
    @primitive = nil
    @component = nil
    @circular_reference = nil
  end

  def clone
    # Клонирование объекта, который имеет вложенный объект с обратной ссылкой,
    # требует специального подхода. После завершения клонирования вложенный
    # объект должен указывать на клонированный объект, а не на исходный объект.

    @component = deep_copy(@component)
    @circular_reference.prototype = self
    deep_copy(self)
  end

  private def deep_copy(object)
    Marshal.load(Marshal.dump(object))
  end
end

class ComponentWithBackReference
  attr_accessor :prototype

  def initialize(prototype)
    @prototype = prototype
  end
end

p1 = Prototype.new
p1.primitive = 245
p1.component = Time.now
p1.circular_reference = ComponentWithBackReference.new(p1)

p2 = p1.clone

if p1.primitive == p2.primitive
  puts 'Primitive field values have been carried over to a clone. Yay!'
else
  puts 'Primitive field values have not been copied. Booo!'
end

if p1.component.equal?(p2.component)
  puts 'Simple component has not been cloned. Booo!'
else
  puts 'Simple component has been cloned. Yay!'
end

if p1.circular_reference.equal?(p2.circular_reference)
  puts 'Component with back reference has not been cloned. Booo!'
else
  puts 'Component with back reference has been cloned. Yay!'
end

if p1.circular_reference.prototype.equal?(p2.circular_reference.prototype)
  print 'Component with back reference is linked to original object. Booo!'
else
  print 'Component with back reference is linked to the clone. Yay!'
end
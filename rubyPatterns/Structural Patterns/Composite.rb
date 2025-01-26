# Компоновщик — это структурный паттерн, 
# который позволяет создавать дерево объектов и работать с ним так же, как и с единичным объ

# Применимость: 
# Паттерн Компоновщик встречается в любых задачах, которые связаны с построением дерева. 
# Самый простой пример — составные элементы GUI, которые тоже можно рассматривать как дерево.

# Базовый класс Компонент объявляет общие операции как для простых, так и для
# сложных объектов структуры.
class Component
  def parent=(parent)
    @parent = parent
  end

  def add(component)
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def remove(component)
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # Вы можете предоставить метод, который позволит клиентскому коду понять,
  # может ли компонент иметь вложенные объекты.
  def composite?
    false
  end

  def operation
    raise NoImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Класс Лист представляет собой конечные объекты структуры. Лист не может иметь
# вложенных компонентов.
#
# Обычно объекты Листьев выполняют фактическую работу, тогда как объекты
# Контейнера лишь делегируют работу своим подкомпонентам.
class Leaf < Component
  def operation
    'Leaf'
  end
end

class Composite < Component
  def initialize
    @children = []
  end

  def add(component)
    @children.push(component)
    component.parent = self
  end

  def remove(component)
    @children.remove(component)
    component.parent = nil
  end

  def composite?
    true
  end
  
  # Контейнер выполняет свою основную логику особым образом. Он проходит
  # рекурсивно через всех своих детей, собирая и суммируя их результаты.
  # Поскольку потомки контейнера передают эти вызовы своим потомкам и так далее,
  # в результате обходится всё дерево объектов.
  def operation
    results = []
    @children.each { |child| results.push(child.operation) }
    "Branch(#{results.join('+')})"
  end

end

def client_code(component)
  puts "RESULT: #{component.operation}"
end

def client_code2(component1, component2)
  component1.add(component2) if component1.composite?

  print "RESULT: #{component1.operation}" 
end

simple = Leaf.new
puts 'Client: I\'ve got a simple component:'
client_code(simple)
puts "\n"

# ...а также сложные контейнеры.
tree = Composite.new

branch1 = Composite.new
branch1.add(Leaf.new)
branch1.add(Leaf.new)

branch2 = Composite.new
branch2.add(Leaf.new)

tree.add(branch1)
tree.add(branch2)

puts 'Client: Now I\'ve got a composite tree:'
client_code(tree)
puts "\n"

puts 'Client: I don\'t need to check the components classes even when managing the tree:'
client_code2(tree, simple)
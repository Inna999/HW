import UIKit

// 1.Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
struct Queue<T: Numeric> {
    private var elements: [T] = []
    //добавляем элемент в очередь
    mutating func push(_ elements: T...) {
        for element in elements {
            self.elements.append(element)
        }
    }
    //извлекаем элемент из очереди
    mutating func pop() -> T? {
        elements.isEmpty ? nil : elements.removeFirst()
    }
//2.Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    func filter(_ predicate: (T) -> Bool) -> [T] {
        var resultArray = [T]()
        for element in elements {
            if predicate(element) {
                resultArray.append(element)
            }
        }
        return resultArray
    }
    
    func changeElement(_ predicate: (T) -> T) -> [T] {
        var resultArray = [T]()
        for element in elements {
            resultArray.append(predicate(element))
        }
        return resultArray
    }
//3.*Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    subscript(index: Int) -> T? {
        (index >= elements.count || index < 0) ? nil : elements[index]
    }
}

//Создадим экземпляр структуры очередь
var queueInt: Queue = Queue<Int>()
queueInt.push(1,2,3,4,5,6,7,8,9)
queueInt.push(85)
queueInt.pop()
queueInt.pop()
queueInt.filter() {$0 == 5 || $0 == 7}
queueInt.changeElement() {$0 + 4}

//Создадим еще экземпляр структуры очередь
var queueDouble = Queue<Double>()
queueDouble.push(3, 5, 6.7, 11)
queueDouble.pop()
queueDouble.filter() {$0 > 7}
queueDouble.changeElement() {$0 / 8}

//Доступ к элементам через индекс
queueInt[0]
queueInt[8]

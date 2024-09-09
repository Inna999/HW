import UIKit

// 1. Написать функцию, которая определяет, четное число или нет.
func even(_ number: Int) -> Bool {
    number % 2 == 0
}
//Проверка работы функции
let num = 12
let evenNumber = even(num)
print("Number \(num) is even: \(evenNumber)")

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3
func divisionThree(_ number: Int) -> Bool {
    number % 3 == 0
}
//Проверка работы функции
let divThree = divisionThree(num)
print("Number \(num) is divisible by three: \(evenNumber)")

// 3. Создать возрастающий массив из 100 чисел.
var array: [Int] = [1]
for i in 1..<100 {
    array.append(array[i-1] + 1)
}

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for element in array {
    if even(element) || !divisionThree(element) {
        if let index = array.firstIndex(of: element) {
            array.remove(at: index)
        }
    }
}

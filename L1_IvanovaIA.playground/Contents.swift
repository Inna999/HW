import UIKit

//1. Решить квадратное уравнение
//ax^2 + bx + c = 0
//Задаем коэффициенты
let a: Double = 1
let b: Double = 4
let c: Double = -5

if a == 0 {
    let x = (-1) * c / b
    print("Ответ: х = \(x)")
} else {
    //Вычисляем дискриминант
    let discrim = b * b - 4 * a * c
    
    if discrim > 0 {
        let x1 = (-b + sqrt(discrim)) / (2 * a)
        let x2 = (-b - sqrt(discrim)) / (2 * a)
        print("Ответ: х1 = \(x1), х2 = \(x2)")
        
    } else if discrim == 0 {
        let x = (-b) / (2 * a)
        print("Ответ: х = \(x)")
        
    } else {
        print("Ответ: нет корней")
    }
}

print("---------------")
//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника
//Задаем катеты
let katet1 = 3.0
let katet2 = 2.0

//Площадь
let s = (katet1 * katet2) / 2
print("Площадь: \(s)")

//Гипотенуза
let gip = sqrt(katet1 * katet1 + katet2 * katet2)
print("Гипотенуза: \(gip)")

//Периметр
let perim = katet1 + katet2 + gip
print("Периметр: \(perim)")

print("---------------")
//3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
let sum = 100_000.0
let rate = 16.0
let years = 5

let result = sum * pow((1 + rate / 100), Double(years))
print("Сумма вклада через \(years) лет: \(round(result * 100) / 100)")

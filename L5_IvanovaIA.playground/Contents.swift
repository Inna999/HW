import UIKit

enum EngineState: String {
    case start = "запущен"
    case stop = "заглушен"
}

enum WindowState: String {
    case open = "открыты"
    case close = "закрыты"
}

//Описание протокола автомобиля
protocol Car {
    var brand: String {get}
    var yearOfProduction: Int {get}
    var engine: EngineState {get set}
    var window: WindowState {get set}
    
    //функция запуска двигателя
    mutating func actionEngine(_ action: EngineState)
    //функция открытия/закрытия окон
    mutating func actionWindow(_ action: WindowState)
}

extension Car {
    //реализация методов по умолчанию
    mutating func actionWindow(_ action: WindowState) {
        window = action
    }
    mutating func actionEngine(_ action: EngineState) {
        engine = action
    }
}

// Расширения,   имплементирующие протокол «CustomStringConvertible» для вывода в консоль описание объекта
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки \(brand), \(yearOfProduction) года выпуска. Окна \(window.rawValue), двигатель \(engine.rawValue). Разгон до 100 км/ч за \(accelerationTo100) c."
    }
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки \(brand), \(yearOfProduction) года выпуска. Окна \(window.rawValue), двигатель \(engine.rawValue). Прицеп: \(trailer ? "есть." : "нет.")"
    }
}

//описание класса спорткар
final class SportCar: Car {
    //реализация требований протокола
    let brand: String
    let yearOfProduction: Int
    var engine: EngineState
    var window: WindowState
    
    //разгон до 100 км/ч
    let accelerationTo100: Double
    
    init(
        brand: String,
        yearOfProduction: Int,
        engine: EngineState = .stop,
        window: WindowState = .close,
        accelerationTo100: Double
    ) {
        self.brand = brand
        self.yearOfProduction = yearOfProduction
        self.engine = engine
        self.window = window
        self.accelerationTo100 = accelerationTo100
    }
}

//Описание класса грузового автомобиля
final class TruckCar: Car {
    //реализация требований протокола
    let brand: String
    let yearOfProduction: Int
    var engine: EngineState
    var window: WindowState
    
    //наличие прицепа
    var trailer: Bool
    
    init(
        brand: String,
        yearOfProduction: Int,
        engine: EngineState = .stop,
        window: WindowState = .close,
        trailer: Bool
    ) {
        self.brand = brand
        self.yearOfProduction = yearOfProduction
        self.engine = engine
        self.window = window
        self.trailer = trailer
    }
}

//Создание экземпляров класса спорткара
var ferrari = SportCar(brand: "Ferrari", yearOfProduction: 2019, accelerationTo100: 2.85)
ferrari.actionEngine(.start)
var honda = SportCar(brand: "Honda", yearOfProduction: 2000, engine: .start, window: .open, accelerationTo100: 3.05)
honda.actionWindow(.close)
print(ferrari)
print(honda)

//Создание экземпляра класса грузовика
var scania = TruckCar(brand: "Scania", yearOfProduction: 2003, trailer: true)
scania.actionEngine(.start)
scania.actionWindow(.open)
print(scania)

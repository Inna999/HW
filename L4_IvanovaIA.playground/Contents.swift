import UIKit

enum EngineState: String {
    case start = "запущен"
    case stop = "заглушен"
}

enum WindowState: String {
    case open = "открыты"
    case close = "закрыты"
}

//Описание класса автомобиля
class Car {
    let brand: String
    let yearOfProduction: Int
    var engine: EngineState
    var window: WindowState
    
    init(
        brand: String,
        yearOfProduction: Int,
        engine: EngineState = .stop,
        window: WindowState = .close
    ) {
        self.brand = brand
        self.yearOfProduction = yearOfProduction
        self.engine = engine
        self.window = window
    }
    
    //функция запуска двигателя
    func actionEngine (_ action: EngineState) {
        engine = action
    }
    
    //Вывод значения свойств на консоль
    func printInfo() {
        print("Автомобиль марки \(brand), \(yearOfProduction) года выпуска. Окна \(window.rawValue), двигатель \(engine.rawValue).")
    }
}

//описание класса спорткар
final class SportCar: Car {
    //разгон до 100 км/ч
    let accelerationTo100: Double
    
    init(
        brand: String,
        yearOfProduction: Int,
        engine: EngineState = .stop,
        window: WindowState = .close,
        accelerationTo100: Double
    ) {
        self.accelerationTo100 = accelerationTo100
        super.init(brand: brand, yearOfProduction: yearOfProduction, engine: engine, window: window)
    }
    
    //при запуске двигателя добавим открытие окон
    override func actionEngine(_ action: EngineState) {
        super.actionEngine(action)
        switch action {
        case .start:
            window = .open
        case .stop:
            window = .close
        }
    }
    
    override func printInfo() {
        super.printInfo()
        print("Разгон до 100 км/ч за \(accelerationTo100) c.")
    }
}

//Описание класса грузового автомобиля
final class TruckCar: Car {
    //наличие прицепа
    var trailer: Bool
    
    init(
        brand: String,
        yearOfProduction: Int,
        engine: EngineState = .stop,
        window: WindowState = .close,
        trailer: Bool
    ) {
        self.trailer = trailer
        super.init(brand: brand, yearOfProduction: yearOfProduction, engine: engine, window: window)
    }
    
    //при запуске двигателя выводится доп сообщение
    override func actionEngine(_ action: EngineState) {
        super.actionEngine(action)
        switch action {
        case .start:
            print("Двигатель \(brand) запущен.")
        case .stop:
            print("Двигатель \(brand) заглушен.")
        }
        
    }
    
    override func printInfo() {
        super.printInfo()
        print("Прицеп: \(trailer ? "есть." : "нет.")")
    }
}

//Создание экземпляра класса спорткара
var ferrari = SportCar(brand: "Ferrari", yearOfProduction: 2019, accelerationTo100: 2.85)
ferrari.actionEngine(.start)
ferrari.printInfo()

//Создание экземпляра класса грузовика
var scania = TruckCar(brand: "Scania", yearOfProduction: 2003, trailer: true)
scania.actionEngine(.start)
scania.actionEngine(.stop)
scania.printInfo()

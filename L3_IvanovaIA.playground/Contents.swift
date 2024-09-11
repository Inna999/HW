import UIKit

enum EngineState: String {
    case start = "запущен"
    case stop = "заглушен"
}

enum WindowState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum Cargo {
    case load(_ volume: Double)
    case unload(_ volume: Double)
}

//Описание легкового автомобиля
struct Car {
    let brand: String
    let yearOfProduction: Int
    let trunkVolume: Double
    var engine: EngineState = .stop
    var window: WindowState = .close
    var filledTrunkVolume: Double = 0
    
    //функция загрузки/разгрузки груза в авто
    mutating func loadingCargo(_ cargo: Cargo) {
        switch cargo {
        case .load(let volume):
            let newVolume = filledTrunkVolume + volume
            if newVolume <= trunkVolume {
                filledTrunkVolume = newVolume
            } else {
                print("Груз не влезает в багажник.")
            }
        case .unload(let volume):
            let newVolume = filledTrunkVolume - volume
            if newVolume >= 0 {
                filledTrunkVolume = newVolume
            } else {
                print("Такого количества груза в багажнике нет.")
            }
        }
    }
    //Вывод значения свойств на консоль
    func printInfo() {
        print("Автомобиль марки \(brand), \(yearOfProduction) года выпуска, объем багажника \(trunkVolume)л. Окна \(window.rawValue), двигатель \(engine.rawValue), заполненный объем багажника \(filledTrunkVolume)л.")
    }
}
//Описание грузового автомобиля
struct Truck {
    let brand: String
    let yearOfProduction: Int
    let bodyVolume: Double
    var engine: EngineState = .stop
    var window: WindowState = .close
    var filledBodyVolume: Double = 0
    //Открытие/закрытие окон
    mutating func actionWindow (_ action: WindowState) {
        window = action
    }
    //Запуск/остановка мотора
    mutating func actionEngine (_ action: EngineState) {
        engine = action
    }
    //Вывод значения свойств на консоль
    func printInfo() {
        print("Грузовой автомобиль марки \(brand), \(yearOfProduction) года выпуска, объем кузова \(bodyVolume)л. Окна \(window.rawValue), двигатель \(engine.rawValue), заполненный объем кузова \(filledBodyVolume)л.")
    }
}
//Создание экземпляра структуры легкового автомобиля
var volvo = Car(brand: "Volvo", yearOfProduction: 2002, trunkVolume: 240)
volvo.loadingCargo(.load(40))
volvo.loadingCargo(.load(240))
volvo.loadingCargo(.unload(10))
volvo.printInfo()

//Создание экземпляра структуры грузового астомобиля
var kamaz = Truck(brand: "Kamaz", yearOfProduction: 2021, bodyVolume: 2000)
kamaz.actionWindow(.open)
kamaz.actionEngine(.start)
kamaz.printInfo()




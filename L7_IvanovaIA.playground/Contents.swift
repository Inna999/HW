import UIKit

//1.Придумать класс, методы которого могут создавать непоправимые ошибки.  Реализовать их с помощью try/catch.
//2.Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием  Error.

protocol Team {
    /// название команды
    var teamName: String {get}
    /// бюджет команды
    var budget: Int {get set}
}

//Структура обновления на болид
struct CarUpdate {
    /// для какой команды
    let F1Team: F1Team
    /// стоимость обновления
    var price: Int             
    /// готовность к установке
    var readyToInstall: Bool
    /// успешно пройдены испытания
    var testSuccess: Bool
}

//Ошибки установки обновления
enum UpdateError: Error {
    /// превышен лимит на сезон
    case noLimit
    /// обновление не готово к установке
    case notReady
    /// не прошло испытания
    case failedTest
    /// нет обновлений
    case noUpdating
}

//Класс команды F1
class F1Team: Team {
    let teamName: String
    var budget: Int = 0
    
    static let moneyLimitForSeason: Int = 135_000_000    //лимит бюджета на сезон
    
    init(teamName: String) {
        self.teamName = teamName
    }
    
    //метод проверки обновления
    func checkUpdating(_ update: CarUpdate) -> (CarUpdate?, UpdateError?) {
        guard update.F1Team.teamName == teamName else {
            return (nil, UpdateError.noUpdating)        //обновлений нет
        }
        return (update, nil)
    }
    
    //метод установки обновления на болид
    func updatingCar(_ update: CarUpdate) throws {
        guard budget + update.price <= F1Team.moneyLimitForSeason else {
            throw UpdateError.noLimit
        }
        guard update.readyToInstall else {
            throw UpdateError.notReady
        }
        guard update.testSuccess else {
            throw UpdateError.failedTest
        }
        budget += update.price
        print("Обновление для \(teamName) установлено.")
    }
}

//Установка обновления
func updateInstall(team: F1Team, update: CarUpdate) {
    //Проверяем наличие обновление
    let newUpdate = team.checkUpdating(update)
    if let updating = newUpdate.0 {
        //Попытка установки обновления
        do {
            try team.updatingCar(updating)
        } catch UpdateError.noLimit {
            print("Обновление для \(team.teamName) не может быть установлено. Превышен лимит на сезон!")
        } catch UpdateError.notReady {
            print("Обновление для \(team.teamName) не готово к установке.")
        } catch UpdateError.failedTest {
            print("Обновление для \(team.teamName) не прошло испытания")
        } catch let error {
            print(error.localizedDescription)
        }
    } else if let error = newUpdate.1 {
        print("Обновление для \(team.teamName) не найдено")
    }
}

//Создаем экземпляры команды
let ferrari = F1Team(teamName: "Ferrari")
let redBull = F1Team(teamName: "Red Bull")
//Создаем обновления
let ferrariUpdate = CarUpdate(F1Team: ferrari, price: 700_000, readyToInstall: true, testSuccess: true)
let redBullUpdate = CarUpdate(F1Team: redBull, price: 151_700_000, readyToInstall: true, testSuccess: true)

updateInstall(team: ferrari, update: ferrariUpdate)
updateInstall(team: redBull, update: redBullUpdate)
updateInstall(team: ferrari, update: redBullUpdate)




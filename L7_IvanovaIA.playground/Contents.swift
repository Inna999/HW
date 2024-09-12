import UIKit

//1.Придумать класс, методы которого могут создавать непоправимые ошибки.  Реализовать их с помощью try/catch.
//2.Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием  Error.

protocol Team {
    var teamName: String {get}      //название команды
    var budget: Int {get set}       //бюджет команды
}

//Структура обновления на болид
struct CarUpdate {
    let F1Team: F1Team          //Для какой команды
    var price: Int              //стоимость обновления
    var readyToInstall: Bool    //готовность к установке
    var testSuccess: Bool       //успешно пройдены испытания
}

//Ошибки установки обновления
enum updateError: Error {
    case noLimit        //превышен лимит на сезон
    case notReady       //обновление не готово к установке
    case failedTest     //не прошло испытания
    case noUpdating     //нет обновлений
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
    func checkUpdating(_ update: CarUpdate) -> (CarUpdate?, updateError?) {
        guard update.F1Team.teamName == self.teamName else {
            return (nil, updateError.noUpdating)        //обновлений нет
        }
        return (update, nil)
    }
    
    //метод установки обновления на болид
    func updatingCar(_ update: CarUpdate) throws {
        guard budget + update.price <= F1Team.moneyLimitForSeason else {
            throw updateError.noLimit
        }
        guard update.readyToInstall else {
            throw updateError.notReady
        }
        guard update.testSuccess else {
            throw updateError.failedTest
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
        } catch updateError.noLimit {
            print("Обновление для \(team.teamName) не может быть установлено. Превышен лимит на сезон!")
        } catch updateError.notReady {
            print("Обновление для \(team.teamName) не готово к установке.")
        } catch updateError.failedTest {
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




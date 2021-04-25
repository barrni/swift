import UIKit

enum CarPossibility {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadVolume(volume: Double)
    case unloadVolume(volume: Double)
}

enum TrunkCarMark {
    case vaz
    case man
    case buldozer
}
enum SportCarMark {
    case audi
    case mersedes
    case bmw
    case hyundai
    case tesla
}

struct TrunkCar {
    var mark: TrunkCarMark
    var year: Int
    var engineVolume: Double
    var isEngineActivate: Bool = false
    var isWindowOpen: Bool = false
    var filledEngineVolume: Double = 0
    
    init(mark: TrunkCarMark, year: Int, engineVolume: Double) {
        self.mark = mark
        self.year = year
        self.engineVolume = engineVolume
    }
    mutating func doAction(type: CarPossibility){
        switch type {
        case .startEngine:
            isEngineActivate = true
        case .stopEngine:
            isEngineActivate = false
        case .openWindows:
            isWindowOpen = true
        case .closeWindows:
            isWindowOpen = false
        case .loadVolume(let volume):
            if filledEngineVolume + volume <= engineVolume {
                filledEngineVolume += volume
            }
        case .unloadVolume(let volume):
            if filledEngineVolume - volume >= 0 {
                filledEngineVolume -= volume
            }
        }
    }
}

struct SportCar {
    var mark: SportCarMark
    var year: Int
    var engineVolume: Double
    var isEngineActivate: Bool = false
    var isWindowOpen: Bool = false
    var filledEngineVolume: Double = 0
    
    init(mark: SportCarMark, year: Int, engineVolume: Double) {
        self.mark = mark
        self.year = year
        self.engineVolume = engineVolume
    }
    
    mutating func doAction(type: CarPossibility){
        switch type {
        case .startEngine:
            isEngineActivate = true
        case .stopEngine:
            isEngineActivate = false
        case .openWindows:
            isWindowOpen = true
        case .closeWindows:
            isWindowOpen = false
        case .loadVolume(let volume):
            if filledEngineVolume + volume <= engineVolume {
                filledEngineVolume += volume
            }
        case .unloadVolume(let volume):
            if filledEngineVolume - volume >= 0 {
                filledEngineVolume -= volume
            }
        }
    }
}

var audi = SportCar(mark: .audi, year: 2021, engineVolume: 2.0)
print(audi)
audi.doAction(type: .startEngine)
print(audi)

var mersedes = SportCar(mark: .mersedes, year: 2020, engineVolume: 3.5)
print(mersedes)
mersedes.doAction(type: .loadVolume(volume: 1.0))
mersedes.doAction(type: .unloadVolume(volume: 2.0))
print(mersedes)


var bmw = SportCar(mark: .bmw, year: 1989, engineVolume: 2.6)
print(bmw)
bmw.doAction(type: .openWindows)
print(bmw)
bmw.doAction(type: .closeWindows)
print(bmw)

var buldozer = TrunkCar(mark: .buldozer, year: 1956, engineVolume: 5.0)
print(buldozer)
buldozer.doAction(type: .loadVolume(volume: 2.0))
print(buldozer)

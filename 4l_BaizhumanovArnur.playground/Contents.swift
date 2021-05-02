import UIKit

enum CarPossibility {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadVolume(volume: Double)
    case unloadVolume(volume: Double)
    case openRoof
    case closeRoof
    case loadBaggage(volume: Double)
    case unloadBaggage(volume: Double)
 }

enum CarMark {
    case toyota
    case mersedes
    case hiynday
    case vaz
    case zil
}

class Car {
    var mark: CarMark
    var year: Int
    var engineVolume: Double
    var isEngineActive: Bool = false
    var isWindowOpen: Bool = false
    var filledEngineVolume: Double = 0
    
    
    func doAction(action: CarPossibility) {
        
    }
    
    init(mark: CarMark, year: Int, engineVolume: Double) {
        self.mark = mark
        self.year = year
        self.engineVolume = engineVolume
    }
    
}

class SportCar: Car {
    var isRoofOpen: Bool = false
    
    init(mark: CarMark, year: Int, engineVolume: Double, isRoofOpen: Bool) {
        self.isRoofOpen = isRoofOpen
        super.init(mark: mark, year: year, engineVolume: engineVolume)
        
    }
    override func doAction(action: CarPossibility) {
        switch action {
                 case .startEngine:
                     isEngineActive = true
                 case .stopEngine:
                     isEngineActive = false
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
                case .openRoof:
                    isRoofOpen = true
                case .closeRoof:
                    isRoofOpen = false
                default: break
                }
             }
}

class TrunkCar: Car {
    var truckBody: Bool = true
    var baggageVolume: Double
    var filledBaggageVolume: Double = 0
        
    init(mark: CarMark, year: Int, engineVolume: Double, truckBody: Bool, baggageVolume: Double, filledBaggageVolume: Double) {
        self.truckBody = truckBody
        self.baggageVolume = baggageVolume
        self.filledBaggageVolume = filledBaggageVolume
        super.init(mark: mark, year: year, engineVolume: engineVolume)
    }
    
    override func doAction(action: CarPossibility) {
        switch action {
        case .startEngine:
            isEngineActive = true
        case .stopEngine:
            isEngineActive = false
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
        case .loadBaggage(let volume):
            if filledBaggageVolume + volume <= baggageVolume {
                filledBaggageVolume += volume
            }
        case .unloadBaggage(let volume):
            if filledBaggageVolume - volume >= 0 {
                filledBaggageVolume -= volume
            }

        default: break
        }
    }
}
   


let sc = SportCar(mark: .toyota , year: 88, engineVolume: 566, isRoofOpen: true)
let tc = TrunkCar(mark: .vaz , year: 2001, engineVolume: 72, truckBody: false, baggageVolume: 540, filledBaggageVolume: 350)

tc.doAction(action: .loadBaggage(volume: 45))
print(tc.filledBaggageVolume)
sc.doAction(action: .openWindows)
sc.doAction(action: .closeRoof)
print(sc.isRoofOpen)
print(sc.isWindowOpen)


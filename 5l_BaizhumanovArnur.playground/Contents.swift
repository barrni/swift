import UIKit

enum CarMark {
    case toyota
    case vaz
    case bizon
    case bmw
}

enum windows{
    case open, close
}

enum engine{
    case run, stop
}
protocol CarProtocol {
    var mark: CarMark {get}
    var year: Int {get}
    var isEngineActive: Bool {get set}
    var isWindowOpen: Bool {get set}
}

extension CarProtocol {
    func actionWindow(status: windows){
        switch status {
        case .open:
            print("windows open")
        case .close:
            print("windows close")
        }
    }
    func actionEngine(status: engine) {
        switch status {
        case .run:
            print("engine is running")
        case .stop:
            print("engine is stopping")
        }
    }
}

protocol TrunkCarProtocol: CarProtocol {
    var truckBody: Bool {get}
    var baggageVolume: Double {get}
    var filledBaggageVolume: Double {get set}
}

extension TrunkCarProtocol {
    func isTruckBody(bool: Bool){
        if bool == false {
            print("No truck body")
        }
        else{
            print("Yes truck body")
        }
    }
    
    mutating func loadBaggageVolume(volume: Double){
        if self.filledBaggageVolume + volume <= self.baggageVolume {
            print("Loading baggage")
            self.filledBaggageVolume += volume
        } else if self.filledBaggageVolume - volume >= 0{
            print("Unloading baggage")
            self.filledBaggageVolume -= volume
        }
    }
}

protocol SportCarProtocol: CarProtocol {
    var isRoofOpen: Bool {get}
}

extension SportCarProtocol {
    func openRoof() {
        if self.isRoofOpen == true {
            print("Roof is open")
        }
        else {
            print("Roof is close")
        }
    }
}

class TrunkCar: TrunkCarProtocol{
    var truckBody: Bool
    
    var baggageVolume: Double
    
    var filledBaggageVolume: Double
    
    var mark: CarMark
    
    var year: Int
    
    var isEngineActive: Bool
    
    var isWindowOpen: Bool
    
    init(mark: CarMark, year: Int, isWindowOpen: Bool, isEngineActive: Bool, baggageVolume: Double, filledBaggageVolume: Double, truckBody: Bool) {
        self.isWindowOpen = isWindowOpen
        self.mark = mark
        self.year = year
        self.truckBody = truckBody
        self.isEngineActive = isEngineActive
        self.baggageVolume = baggageVolume
        self.filledBaggageVolume = filledBaggageVolume
    }
}

class SportCar : SportCarProtocol {
    var isRoofOpen: Bool
    
    var mark: CarMark
    
    var year: Int
    
    var isEngineActive: Bool
    
    var isWindowOpen: Bool
    
    init(isRoofOpen: Bool, mark: CarMark, year: Int, isEngineActive: Bool, isWindowOpen: Bool) {
        self.isRoofOpen = isRoofOpen
        self.isEngineActive = isEngineActive
        self.isWindowOpen = isWindowOpen
        self.mark = mark
        self.year = year
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Automobile \(mark)\n" +
        "year: \(year)\n" +
        "engine: \(engine.self)\n" +
        "windows: \(windows.self)\n" +
        "body: \(truckBody)\n"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Automobile \(mark)\n" +
            "year: \(year)\n" +
                "engine: \(engine.self)\n" +
                "windows: \(windows.self)\n" +
            "roof: \(isRoofOpen)\n"
    }
}

var sportCar = SportCar(isRoofOpen: true, mark: .toyota, year: 2018, isEngineActive: true, isWindowOpen: false)
var trunkCar = TrunkCar(mark: .vaz, year: 1999, isWindowOpen: true, isEngineActive: false, baggageVolume: 230, filledBaggageVolume: 50, truckBody: true)

print(sportCar)
print(trunkCar)


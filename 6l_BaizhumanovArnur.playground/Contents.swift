import UIKit

struct queue<Element: Comparable> {
    var items = [Element]()
    
    mutating func newElement(_ item: Element) {
        items.append(item)
    }
    
    mutating func nextElement() -> Element {
        print("Next element in queue is \(items.first!)")
        return items.removeFirst()
    }
    
    func filter(item: Element) {
        print("Find \(items.filter{$0 == item })")
    }
    
    mutating func sort() -> [Element] {
        return items.sorted(by: >)
    }
    
    subscript (index: Int) -> Element? {
        return (index < items.count ? items[index] : nil)
    }
}


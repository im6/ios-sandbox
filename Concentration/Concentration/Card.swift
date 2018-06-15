import Foundation

struct Card {
    var id: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    static var idFactory = 0
    static func generateId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.id = Card.generateId()
    }
}

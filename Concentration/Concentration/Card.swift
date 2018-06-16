import Foundation

struct Card: Hashable, Equatable {
    var hashValue: Int { get { return id }}
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    private var id: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    private static var idFactory = 0
    private static func generateId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.id = Card.generateId()
    }
}

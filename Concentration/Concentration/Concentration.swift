//
//  Concentration.swift
//  Concentration
//
//  Created by Zijian Guo on 6/15/18.
//  Copyright © 2018 Zijian Guo. All rights reserved.
//

import Foundation

class Concentration {
    private(set ) var cards = [Card]()
    private var unmatchedIdx: Int? {
        get {
            var matchIndex: Int?
            for idx in cards.indices{
                if cards[idx].isFaceUp {
                    if matchIndex == nil {
                        matchIndex = idx
                    } else {
                        return nil
                    }
                }
            }
            
            return matchIndex
        }
        set {
            for idx in cards.indices{
                cards[idx].isFaceUp = (idx == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "concentration.chooseCard at \(index): index out of card.")
        if cards[index].isMatched {
            print("no need to click again")
        } else {
            if let umId = unmatchedIdx, umId != index {
                if cards[umId].id == cards[index].id {
                    cards[umId].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
                unmatchedIdx = index

            }
        }
    }
    
    init(numberOfPairInCards: Int){
        assert(numberOfPairInCards > 0, "concentration.init(at: \(numberOfPairInCards)): pair number not valid.")
        for _ in 0..<numberOfPairInCards{
            let card = Card()
            self.cards += [card, card]
        }
    }
    
}

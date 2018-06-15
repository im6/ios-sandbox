//
//  Concentration.swift
//  Concentration
//
//  Created by Zijian Guo on 6/15/18.
//  Copyright © 2018 Zijian Guo. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var unmatchedIdx: Int?
    
    func chooseCard(at index: Int){
        if cards[index].isMatched {
            print("no need to click again")
        } else {
            if let umId = unmatchedIdx, umId != index {
                if cards[umId].id == cards[index].id {
                    cards[umId].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                unmatchedIdx = nil
                
            } else {
                for v in cards.indices{
                    cards[v].isFaceUp = false
                }
                cards[index].isFaceUp = true
                unmatchedIdx = index

            }
        }
    }
    
    init(numberOfPairInCards: Int){
        for _ in 0..<numberOfPairInCards{
            let card = Card()
            self.cards += [card, card]
        }
    }
    
}

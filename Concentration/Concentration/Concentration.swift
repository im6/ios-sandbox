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
    func chooseCard(at index: Int){
        self.cards[index].isFaceUp = !self.cards[index].isFaceUp
    }
    
    init(numberOfPairInCards: Int){
        for _ in 0..<numberOfPairInCards{
            let card = Card()
            self.cards += [card, card]
        }
    }
    
}

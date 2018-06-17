//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Zijian Guo on 6/17/18.
//  Copyright © 2018 Zijian Guo. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    var suit: Suit
    var rank: Rank
    var description: String{
        return "\(suit) \(rank)"
    }
    
    enum Suit: String, CustomStringConvertible {
        case spade = "♠️"
        case diamond = "♦️"
        case club = "♣️"
        case heart = "♥️"
        
        
        static let all = [Suit.spade, .club, .heart, .diamond]
        var description: String {
            return rawValue
        }
    }
    
    enum Rank: CustomStringConvertible {
        case ace
        case face(String)
        case numeric(Int)
        
        static var all: [Rank] {
            var allRank = [Rank.ace]
            for num in 2...10 {
                allRank.append(Rank.numeric(num))
            }
            allRank += [Rank.face("J"), .face("Q"), .face("K")]
            return allRank
        }
        
        var description: String{
            switch self {
                case .ace: return "A"
                case .face(let face): return "\(face)"
                case .numeric(let num): return "\(num)"
            }
        }
        var order: Int {
            switch self{
                case .ace: return 1
                case .numeric(let num): return num
                case .face(let kind) where kind == "J": return 11
                case .face(let kind) where kind == "Q": return 12
                case .face(let kind) where kind == "K": return 13
                default: return 0
            }
        }
    }
}

//
//  ViewController.swift
//  PlayingCard
//
//  Created by Zijian Guo on 6/17/18.
//  Copyright © 2018 Zijian Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var deck = PlayingCardDeck.init()
        for _ in 1...10{
            if let card = deck.draw(){
                print(card)
            }
            
        }
    }


}


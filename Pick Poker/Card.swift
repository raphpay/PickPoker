//
//  Card.swift
//  Pick Poker
//
//  Created by Raphaël Payet on 24/07/2020.
//  Copyright © 2020 Oriapy. All rights reserved.
//

import Foundation

struct Card : Codable, Identifiable {
    let id      = UUID()
    var value   : Int
    var suit    : String
    var image   : String
}

struct CardManager {
    func getCards(for suit : String) -> [Card] {
        var cardsFromSuit : [Card] = []
        
        for card in cards {
            if card.suit == suit {
                cardsFromSuit.append(card)
            }
        }
        
        return cardsFromSuit
    }
    
    func getCardSuit(for name : String) -> String {
        if name.contains("H") {
            return "hearts"
        } else if name.contains("D") {
            return "diamonds"
        } else if name.contains("S") {
            return "spades"
        } else if name.contains("C") {
            return "clubs"
        }
        
        return ""
    }
}

let hearts = CardManager().getCards(for: "hearts")
let clubs = CardManager().getCards(for: "clubs")
let shades = CardManager().getCards(for: "shades")
let diamonds = CardManager().getCards(for: "diamonds")

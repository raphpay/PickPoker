//
//  AllCardsView.swift
//  Pick Poker
//
//  Created by Raphaël Payet on 24/07/2020.
//  Copyright © 2020 Oriapy. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds
let cards = Bundle.main.decode([Card].self, from: "pokerCards.json")

struct AllCardsView: View {
    @Binding var selectedSuit : String
    var cardManager = CardManager()
       
    
    var body: some View {
        
        
        VStack {
            CardLine(from : 2, to : 5, cards: hearts)
            CardLine(from: 6, to: 9, cards: hearts)
            CardLine(from: 10, to: 13, cards: hearts)
            CardLine(from: 14, to: 14, cards: hearts)
        }
        
    }
}

struct AllCardsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCardsView(selectedSuit: .constant("hearts"))
    }
}

struct CardView: View {
    var name : String
    
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minWidth : screen.width / 4 - 20, maxHeight: screen.height / 4 - 20)
            .shadow(radius: 20)
    }
}

struct CardLine: View {
    var from    : Int = 0
    var to      : Int = 15
    var cards   : [Card]
    
    var body: some View {
        HStack {
            ForEach(cards) { card in
                if card.value >= self.from && card.value <=  self.to {
                    CardView(name: card.image)
                }
            }
        }
    }
}

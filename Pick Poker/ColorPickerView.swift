//
//  ColorPickerView.swift
//  Pick Poker
//
//  Created by Raphaël Payet on 24/07/2020.
//  Copyright © 2020 Oriapy. All rights reserved.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State var selectedSuit : String = ""
    
    var body: some View {
        HStack {
            AceCardView(name : "AH", selectedSuit: $selectedSuit)
            AceCardView(name: "AD", selectedSuit: $selectedSuit)
            AceCardView(name: "AS", selectedSuit: $selectedSuit)
            AceCardView(name: "AC", selectedSuit: $selectedSuit)
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}

struct AceCardView: View {
    
    var cardManager = CardManager()
    
    var name : String
    
    @Binding var selectedSuit : String
    
    var body: some View {
        
        let suit = cardManager.getCardSuit(for: name)
        
        return VStack {
            CardView(name: name)
            Text(suit.capitalized)
                .font(.system(size: 30, weight: .bold, design: .monospaced))
        }.onTapGesture {
            self.selectedSuit = suit
        }
    }
}

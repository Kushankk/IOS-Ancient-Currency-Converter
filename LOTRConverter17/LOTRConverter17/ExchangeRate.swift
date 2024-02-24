//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Kushank Virdi on 2024-02-16.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage : ImageResource
    let text : String
    let rightImage : ImageResource
    
    var body: some View {
        HStack{
            //Left Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //Text
            Text(text)
            
            //Right Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece , text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}

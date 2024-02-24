//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Kushank Virdi on 2024-02-16.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    //@State var currency : Currency
    
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency:Currency
    var body: some View {
        
        ZStack{
            
            //Background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
        
            VStack{
                
                //Text
                Text("Select the Currency you are starting with:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                
                
                //Currency Icon
                IconGrid(currency: $topCurrency)
                
                
                
                
                
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                
                //Currency Icon
                IconGrid(currency: $bottomCurrency)
                
                
               
                
                //Done Button
                Button("Done"){
                    
                    dismiss()
                    
                }.buttonStyle(.borderedProminent)
                    .tint(.brown)
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.goldPenny), bottomCurrency: .constant(.silverPiece))
}


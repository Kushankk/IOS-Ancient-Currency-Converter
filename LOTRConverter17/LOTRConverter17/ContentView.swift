//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Kushank Virdi on 2024-02-12.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    
    @State var LeftField = ""
    @State var RightField = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack{
            //Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                //Prancing pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //Currency Exchange Text
                Text("Curreny Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                //Conversion Section
                HStack{
                    
                    //left section
                    VStack{
                        //Currency
                        HStack{
                            //Currency Image
                            Image(leftCurrency.Image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                        }
                        .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                        
                        .padding(.bottom,-5)
                        .onTapGesture {
                                showSelectCurrency.toggle()
                            }
                        TextField("Amount", text: $LeftField)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            
                                
                            
                    }
                    //equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .symbolEffect(.pulse)
                        .foregroundColor(.white)
                    //right section
                    VStack{
                        //Currency
                        HStack{
                            //Currency Image
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            Image(rightCurrency.Image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Currency Text
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            
                        }
                        //Text Field
                        TextField("Amount", text: $RightField)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                                
                            
                    }
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                //Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                    
                    
                    .onChange(of: LeftField) {
                        if leftTyping{
                            RightField = leftCurrency.convert(LeftField, to: rightCurrency)
                        }
                        }
                    
                    .onChange(of: RightField) {
                        if rightTyping{
                            LeftField = rightCurrency.convert(RightField, to: leftCurrency)
                        }
                        }
                    .onChange(of: leftCurrency) {
                        LeftField = rightCurrency.convert(RightField, to: leftCurrency)
                    }
                    
                    .onChange(of: rightCurrency) {
                        RightField = leftCurrency.convert(LeftField, to: rightCurrency)
                    }
                    
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency){
                        SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
                    
                    
                }
                
            }
            
        } //Z Stack ends here
        
        .task {
            try? Tips.configure()
            
        }
        
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Kushank Virdi on 2024-02-12.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var LeftField = ""
    @State var RightField = ""
    
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
                        .padding(.bottom,-5)
                        .onTapGesture {
                                showSelectCurrency.toggle()
                            }
                        TextField("Amount", text: $LeftField)
                            .textFieldStyle(.roundedBorder)
                            
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
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency){
                        SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
                    
                    
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

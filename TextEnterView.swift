//
//  TextEnterView.swift
//  Caesar Cracker
//
//  Created by Dominic VandenElzen on 2/15/24.
//

import SwiftUI



struct TextEnterView: View {
    @State public var textStr : String = String()
    @State public var key : String = String()
    @State var encrypt = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                TextField (
                    "Enter what you would like to encrypt: ",
                    text: $textStr
                )
                .keyboardType(.default)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onChange(of: textStr) {
                    if textStr.count > 255 {
                        textStr = String(textStr.prefix(255))
                    }
                }
                
                Text("Number of characters \(textStr.count)")
                    .foregroundStyle(.gray)
        
                
                TextField (
                    "Enter the number of the key to encrypt with",
                    text: $key
                )
                .keyboardType(.numberPad)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onChange(of: key) { // Limit number of characters of key to 2
                    if key.count > 2 {
                        key = String(key.prefix(2))
                    }
                }
                
                Button("Encrpt!") {
                    encrypt = true
                }
                .buttonStyle(.bordered)
                
                .navigationDestination(isPresented: ($encrypt)) {
                    ListCiphersView(userInput: textStr, userKey: key)
                }
            }
        }
        
        
    }
}

#Preview {
    TextEnterView()
}

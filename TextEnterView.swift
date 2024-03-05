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
    @State var textSubmitted = false
    @State var keySubmitted = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                TextField (
                    "Enter what you would like to encrypt: ",
                    text: $textStr
                )
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit(of: .text) {
                    textSubmitted = true
                }
                
                TextField (
                    "Enter the number of the key to encrypt with",
                    text: $key
                )
                .keyboardType(.numberPad)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit(of: .text) {
                    keySubmitted = true
                }
                
                .navigationDestination(isPresented: ($keySubmitted)) {
                    ListCiphersView(userInput: textStr, userKey: key)
                }
            }
        }
        
        
    }
}

#Preview {
    TextEnterView()
}

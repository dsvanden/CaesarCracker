//
//  ContentView.swift
//  Caesar Cracker
//
//  Created by Dominic VandenElzen on 2/1/24.
//

import SwiftUI

struct ListCiphersView: View {
    var userInput : String = String()
    var userKey : String = String()
    @State var isHiddenList = true
    @State var isHiddenButton = false
    
    var body: some View {
        VStack {
            let testStr = caesarCipher(input: userInput, key: UInt8(userKey) ?? 0)
            Text("Cipher text of \"\(userInput)\" using a key of \(userKey) is: \"\(testStr)\"")
                .multilineTextAlignment(.center)
            
            if !isHiddenButton {
                Button("Decrypt!") {
                    isHiddenList = false
                    isHiddenButton = true
                }
                .buttonStyle(.bordered)
            }
            
            
            let strArray = smartDecrypt(cipherText: testStr)
            
            if !isHiddenList {
                List {
                    ForEach(strArray) { ciphers in
                        Text(ciphers.cipherText)
                            .listRowBackground(Color(
                                red: (252/255), green: (251/255), blue: (220/255)))
                    }
                }
            }
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(red: (252/255), green: (251/255), blue: (220/255)))
        //.padding()
    }
}

#Preview {
    ListCiphersView()
}

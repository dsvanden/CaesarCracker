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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            let testStr = caesarCipher(input: userInput, key: UInt8(userKey) ?? 0)
            Text("Cipher text of \"\(userInput)\" using a key of \(userKey) is: \"\(testStr)\"")
                .multilineTextAlignment(.center)
            let strArray = decipherCaesar(cipherText: testStr)
            List {
                ForEach(strArray) { ciphers in
                    Text(ciphers.cipherText)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ListCiphersView()
}

func caesarCipher(input : String, key : UInt8) -> String {
    var cipherText : String = String()
    let k : UInt8 = key % 26
    for Character in input {
        if Character.isASCII && Character.isLetter {
            var asciiVal : UInt8 = Character.asciiValue!
            var newChar : String = String(UnicodeScalar(asciiVal))
            if Character.isLowercase {
                asciiVal += k
                if asciiVal > 122 {
                    asciiVal -= 26
                }
                newChar = String(UnicodeScalar(asciiVal))
            } else {
                asciiVal += k
                if asciiVal > 90 {
                    asciiVal -= 26
                }
                newChar = String(UnicodeScalar(asciiVal))
            }
            
            cipherText += newChar
        } else {
            cipherText += String(Character)
        }
        
    }
    return cipherText
}

func decipherCaesar(cipherText : String) -> [Ciphers] {
    var ciphers : [Ciphers] = Array()
    
    for k in 1...25 {
        var tempStr : String = String()
        for Character in cipherText {
            if Character.isASCII && Character.isLetter {
                var asciiVal : UInt8 = Character.asciiValue!
                var newChar : String = String(UnicodeScalar(asciiVal))
                if Character.isLowercase {
                    asciiVal += UInt8(k)
                    if asciiVal > 122 {
                        asciiVal -= 26
                    }
                    newChar = String(UnicodeScalar(asciiVal))
                } else {
                    asciiVal += UInt8(k)
                    if asciiVal > 90 {
                        asciiVal -= 26
                    }
                    newChar = String(UnicodeScalar(asciiVal))
                }
                
                tempStr += newChar
            } else {
                tempStr += (String(Character))
            }
        }
        ciphers.append(Ciphers(cipherText: tempStr))
    }
    
    return ciphers
    
}

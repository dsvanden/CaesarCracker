//
//  EncryptDecrypt.swift
//  Caesar Cracker
//
//  Created by Dominic VandenElzen on 3/14/24.
//

import Foundation

func caesarCipher(input: String, key: UInt8) -> String {
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

func smartDecrypt(cipherText: String) -> [Ciphers] {
    var ciphers : [Ciphers] = Array()
    
    for k in 1...25 {
        let tempStr = caesarCipher(input : cipherText, key : UInt8(k))
        ciphers.append(Ciphers(cipherText: tempStr))
    }
    return ciphers
}

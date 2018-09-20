import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String
    func decode(_ ciphertext: String, secret: String) -> String
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String {
        var encoded = ""
        var shiftBy = UInt32(secret)!

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ ciphertext:String, secret: String) -> String {
        var decoded = ""
        var unshiftBy = UInt32(secret)!
        
        for character in ciphertext {
            let unicode = character.unicodeScalars.first!.value
            let unshiftedUnicode = unicode - unshiftBy
            let unshiftedCharacter = String(UnicodeScalar(UInt8(unshiftedUnicode)))
            decoded = decoded + unshiftedCharacter
        }
        return decoded
    }
}

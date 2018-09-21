import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ ciphertext: String, secret: String) -> String?
}

// AlphaNumericCesarCipher
struct AlphaNumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ ciphertext:String, secret: String) -> String? {
        var decoded = ""
        guard let unshiftBy = UInt32(secret) else {
            return nil
        }
        
        for character in ciphertext {
            let unicode = character.unicodeScalars.first!.value
            print(unshiftBy)
            let unshiftedUnicode = unicode - unshiftBy
            let unshiftedCharacter = String(UnicodeScalar(UInt8(unshiftedUnicode)))
            decoded = decoded + unshiftedCharacter
        }
        return decoded
    }

}


//CeasarCipher
struct CeaserCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ ciphertext:String, secret: String) -> String? {
        var decoded = ""
        guard let unshiftBy = UInt32(secret) else {
            return nil
        }
        
        for character in ciphertext {
            let unicode = character.unicodeScalars.first!.value
            print(unshiftBy)
            let unshiftedUnicode = unicode - unshiftBy
            let unshiftedCharacter = String(UnicodeScalar(UInt8(unshiftedUnicode)))
            decoded = decoded + unshiftedCharacter
        }
        return decoded
    }
}


// Cypher13
struct Cypher13: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + 13
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ ciphertext:String, secret: String) -> String? {
        var decoded = ""
        guard let unshiftBy = UInt32(secret) else {
            return nil
        }
        
        for character in ciphertext {
            let unicode = character.unicodeScalars.first!.value
            print(unshiftBy)
            let unshiftedUnicode = unicode - 13
            let unshiftedCharacter = String(UnicodeScalar(UInt8(unshiftedUnicode)))
            decoded = decoded + unshiftedCharacter
        }
        return decoded
    }
    
}

// SuperCypher
struct SuperCypher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + (shiftBy * 2)
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ ciphertext:String, secret: String) -> String? {
        var decoded = ""
        guard let unshiftBy = UInt32(secret) else {
            return nil
        }
        
        for character in ciphertext {
            let unicode = character.unicodeScalars.first!.value
            print(unshiftBy)
            let unshiftedUnicode = unicode - (unshiftBy  * 2)
            let unshiftedCharacter = String(UnicodeScalar(UInt8(unshiftedUnicode)))
            decoded = decoded + unshiftedCharacter
        }
        return decoded
    }
    
}


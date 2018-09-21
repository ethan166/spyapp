import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "ceasar": CeaserCipher(),
        "alphanumceasar": AlphaNumericCesarCipher(),
        "cypher13":Cypher13(),
        "supercypher":SuperCypher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}

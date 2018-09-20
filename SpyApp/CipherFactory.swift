import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "ceasar": CeaserCipher(),
        "alphanumceasar": CeaserCipher()
        
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}

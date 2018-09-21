import UIKit

class SpyAppViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var CipherControl: UISegmentedControl!
    
    let factory = CipherFactory()
    var cipher: Cipher!

    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.secret.delegate = self;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    var plaintext: String {
        if let text = input.text {
            if(CipherControl.selectedSegmentIndex == 1) {
                print(text)
                return text.uppercased();
            } else {
                return text
            }
            
        } else {
            return ""
        }
    }
    
    var secretText: String {
        if let text = secret.text {
        
            return text
        } else {
            return ""
        }
    }
    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        
        let ciphermethod = ["ceasar","alphanumceasar","cypher13","supercypher"]
        var cipher_key = ciphermethod[CipherControl.selectedSegmentIndex]
        cipher = factory.cipher(for: cipher_key)
        
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
     
    }
    
    
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        
        let ciphermethod = ["ceasar","alphanumceasar","cypher13","supercypher"]
        var cipher_key = ciphermethod[CipherControl.selectedSegmentIndex]
        cipher = factory.cipher(for: cipher_key)
        
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let decoded = cipher.decode(plaintext, secret: secretText) {
            output.text = decoded
        } else {
            output.text = "Error decoding"
        }
        
    }
    




}


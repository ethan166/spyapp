import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var CipherControl: UISegmentedControl!
    
    let factory = CipherFactory()
    var cipher: Cipher!

    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let ciphermethod = ["ceasar","alphanumceasar"]
 
        let cipher_key = ciphermethod[CipherControl.selectedSegmentIndex]

        //let cipher_key = "cesar"
        cipher = factory.cipher(for: cipher_key)
    }
    
    var plaintext: String {
        if let text = input.text {
            return text
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
    
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
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
    
    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
        /*
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.encode(plaintext, secret: secret)
 */
    }

    
    // We will talk about this method during lecture
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        /*
        let key = sender.titleLabel!.text!
        cipher = factory.cipher(for: key)
        */
        
         guard
         let buttonLable = sender.titleLabel,
         let buttonText = buttonLable.text
         else {
         output.text = "No button or no button text"
         return
         }
         cipher = factory.cipher(for: buttonText)
 
    }

}


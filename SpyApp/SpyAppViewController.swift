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
        
        let ciphermethod = ["cesar","alphanumcesar"]
 
        let cipher_key = ciphermethod[CipherControl.selectedSegmentIndex]

        //let cipher_key = "cesar"
        cipher = factory.cipher(for: cipher_key)
    }
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        let ciphertext = input.text!
        let secret = self.secret.text!
        output.text = cipher.decode(ciphertext, secret: secret)
    }
    
    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.encode(plaintext, secret: secret)
    }

    // We will talk about this method during lecture
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        let key = sender.titleLabel!.text!
        cipher = factory.cipher(for: key)
    }

}


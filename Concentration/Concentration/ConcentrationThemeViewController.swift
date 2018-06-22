

import UIKit

class ConcentrationThemeViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseTheme"{
            if let button = sender as? UIButton {
                let theme = button.currentTitle
                if let cvc = segue.destination as? ConcentrationViewController {
                    print("\(theme)")
                }
            }
        }
        
    }

}

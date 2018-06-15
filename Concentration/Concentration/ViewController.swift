
import UIKit

class ViewController: UIViewController {
    var game = Concentration(numberOfPairInCards: 2)
    var steps = 0 {
        didSet {
            self.stepLabel.text = "\(steps)"
        }
    }

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cardClick(_ sender: UIButton) {
        steps += 1
        if let cardInd = cardButtons.index(of: sender) {
            game.chooseCard(at: cardInd)
            renderView()
        }
        
    }
    
    var emojisSource = ["😈", "👽", "🐋", "🐕", "🌵", "🐬", "🐝"]
    var emoji = [Int:String]()
    
    func getEmoji(for cardId: Int) -> String {
        if emoji[cardId] == nil {
            let randNum = Int(arc4random_uniform(UInt32(emojisSource.count)))
            emoji[cardId] = emojisSource[randNum]
        }
        return emoji[cardId] ?? "?"
    
    }
    
    func renderView(){
        for ind in self.cardButtons.indices{
            let btn = self.cardButtons[ind]
            let card = game.cards[ind]
            if card.isFaceUp {
                btn.setTitle(getEmoji(for: card.id), for: UIControlState.normal)
                btn.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                btn.setTitle("", for: UIControlState.normal)
                btn.backgroundColor = card.isMatched ? #colorLiteral(red: 0.3719838262, green: 0.3606083989, blue: 0.699976027, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }

        }
    }
    
}


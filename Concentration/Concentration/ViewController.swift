
import UIKit

class ViewController: UIViewController {
    private var game = Concentration(numberOfPairInCards: 2)
    private(set) var steps = 0 {
        didSet {
            self.stepLabel.text = "\(steps)"
        }
    }

    @IBOutlet private weak var stepLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func cardClick(_ sender: UIButton) {
        steps += 1
        if let cardInd = cardButtons.index(of: sender) {
            game.chooseCard(at: cardInd)
            renderView()
        }
        
    }
    
    private var emojisSource = ["😈", "👽", "🐋", "🐕", "🌵", "🐬", "🐝"]
    private var emoji = [Card:String]()
    
    private func getEmoji(for card: Card) -> String {
        if emoji[card] == nil {
            let randNum = Int(arc4random_uniform(UInt32(emojisSource.count)))
            emoji[card] = emojisSource.remove(at: randNum)
        }
        return emoji[card] ?? "?"
    
    }
    
    private func renderView(){
        for ind in self.cardButtons.indices{
            let btn = self.cardButtons[ind]
            let card = game.cards[ind]
            if card.isFaceUp {
                btn.setTitle(getEmoji(for: card), for: UIControlState.normal)
                btn.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                btn.setTitle("", for: UIControlState.normal)
                btn.backgroundColor = card.isMatched ? #colorLiteral(red: 0.3719838262, green: 0.3606083989, blue: 0.699976027, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }

        }
    }
    
}


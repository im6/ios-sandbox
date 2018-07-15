import UIKit

class ColorTableViewCell: UITableViewCell {

    @IBOutlet var colorButtons: [UIButton]!
    @IBOutlet weak var likedNumLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var color: VPColor? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        if let currentColor = color {
            let btnText = currentColor.isLiked ? "❤️" : "♡"
            likedNumLabel?.text = "\(currentColor.likeNum)"
            likeButton.setTitle(btnText, for: UIControlState.normal)
            colorButtons[0].backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            colorButtons[1].backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            colorButtons[2].backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            colorButtons[3].backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
        
    }
}

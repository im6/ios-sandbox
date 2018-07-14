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
        }
        
    }
}

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
        likedNumLabel?.text = "\(color?.likeNum ?? 0)"
    }
}

import UIKit

class ColorTableViewCell: UITableViewCell {

    @IBOutlet var colorButtons: [UIButton]!
    @IBOutlet weak var likeButton: UIButton!
    @IBAction func onColorBtnClick(_ sender: UIButton) {
        if let onButtonTapped = self.onColorBarClick,
            let selectedColor = color {
            onButtonTapped(selectedColor)
        }
    }
    
    var onColorBarClick : ((VPColor) -> Void)? = nil
    var color: VPColor? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        let convFn = Shared.sharedInstance.convertStringToColor
        if let currentColor = color {
            let btnHeart = currentColor.isLiked ? "♥️" : "♡"
            let btnText = "\(btnHeart) \(currentColor.likeNum)"
            likeButton.setTitle(btnText, for: UIControlState.normal)
            colorButtons[0].backgroundColor = convFn(currentColor.color[0])
            colorButtons[1].backgroundColor = convFn(currentColor.color[1])
            colorButtons[2].backgroundColor = convFn(currentColor.color[2])
            colorButtons[3].backgroundColor = convFn(currentColor.color[3])
        }
        
    }
}

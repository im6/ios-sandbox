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
    
    private func convertStringToColor(str: String) -> UIColor? {
        let slice0 = str[str.startIndex..<str.index(str.startIndex, offsetBy: 2)]
        let slice1 = str[str.index(str.startIndex, offsetBy: 2)..<str.index(str.startIndex, offsetBy: 4)]
        let slice2 = str[str.index(str.startIndex, offsetBy: 4)..<str.index(str.startIndex, offsetBy: 6)]
        if let hexValue0 = UInt(slice0, radix: 16),
            let hexValue1 = UInt(slice1, radix: 16),
            let hexValue2 = UInt(slice2, radix: 16) {
            let colorResult = UIColor(red: CGFloat(Float(hexValue0)/255.0),
                                 green: CGFloat(Float(hexValue1)/255.0),
                                 blue: CGFloat(Float(hexValue2)/255.0),
                                 alpha: 1)
            return colorResult
        } else {
            return nil
        }
    }
    
    private func updateUI() {
        if let currentColor = color {
            let btnHeart = currentColor.isLiked ? "♥️" : "♡"
            let btnText = "\(btnHeart) \(currentColor.likeNum)"
            likeButton.setTitle(btnText, for: UIControlState.normal)
            colorButtons[0].backgroundColor = convertStringToColor(str: currentColor.color[0])
            colorButtons[1].backgroundColor = convertStringToColor(str: currentColor.color[1])
            colorButtons[2].backgroundColor = convertStringToColor(str: currentColor.color[2])
            colorButtons[3].backgroundColor = convertStringToColor(str: currentColor.color[3])
        }
        
//        let bgColorView = UIView()
//        bgColorView.backgroundColor = nil
//        self.selectedBackgroundView = bgColorView
        
    }
}

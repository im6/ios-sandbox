
import UIKit

class PlayingCardView: UIView {
    private func centeredAttributedString(_ str: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: <#T##String#>)
        
        
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 36)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
    }

}

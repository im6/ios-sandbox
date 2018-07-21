
import Foundation
import UIKit

class Shared {
    static let sharedInstance = Shared()
    
    func convertStringToColor(str: String) -> UIColor {
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
            return UIColor.black
        }
    }
    
    private init() {
        // initialize property
    }
}

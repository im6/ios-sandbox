import UIKit

class ColorCanvasView: UIView {
    override func draw(_ rect: CGRect) {

        let rectMargin:CGFloat = 20
        let rectWidth:CGFloat = 100
        let rectHeight:CGFloat = 100
        
        // Find center of actual frame to set rectangle in middle
        let xf:CGFloat = (self.frame.width  - rectWidth)  / 2
        let yf:CGFloat = (self.frame.height - rectHeight) / 2
        
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.saveGState()
        
        let rect = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: 2).cgPath
        
        ctx.addPath(clipPath)
        ctx.setFillColor(UIColor.green.cgColor)

        
        let rect1 = CGRect(x: 40, y: 40, width: 40, height: 40)
        let clipPath1: CGPath = UIBezierPath(roundedRect: rect1, cornerRadius: 2).cgPath
        ctx.addPath(clipPath1)
        ctx.setFillColor(UIColor.green.cgColor)

        ctx.closePath()
        ctx.fillPath()
        ctx.restoreGState()
    }
}

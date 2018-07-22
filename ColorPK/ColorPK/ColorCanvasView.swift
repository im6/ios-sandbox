import UIKit

class ColorCanvasView: UIView {
    var colors: [CGColor]!
    override func draw(_ rect: CGRect) {
        let rectMargin:CGFloat = 10
        let rectWidth:CGFloat = 250
        let rectHeight:CGFloat = 270
        let outCornerRadius:CGFloat = 5
        let InCornerRadius:CGFloat = 3
        let heightPercent:[CGFloat] = [0.25, 0.25, 0.25, 0.25]
        
        let outterRectX:CGFloat = (self.frame.width  - rectWidth) / 2
        let outterRectY:CGFloat = (self.frame.height - rectHeight) / 2
        
        let innerWidth = rectWidth - (rectMargin * 2)
        let innerHeight = rectHeight - (rectMargin * 2)
        
        let rect0X:CGFloat = (self.frame.width - rectWidth) / 2  + rectMargin
        let rect0Y:CGFloat = (self.frame.height - rectHeight) / 2  + rectMargin
        
        let rect1X:CGFloat = rect0X
        let rect1Y:CGFloat = rect0Y + (innerHeight * heightPercent[0])
        
        let rect2X:CGFloat = rect0X
        let rect2Y:CGFloat = rect1Y + (innerHeight * heightPercent[1])
        
        let rect3X:CGFloat = rect0X
        let rect3Y:CGFloat = rect2Y + (innerHeight * heightPercent[2])

        
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        
        let outerRect = CGRect(x: outterRectX, y: outterRectY, width: rectWidth, height: rectHeight)
        let clipPathOuter: CGPath = UIBezierPath(roundedRect: outerRect, cornerRadius: outCornerRadius).cgPath
        ctx.addPath(clipPathOuter)
        ctx.setFillColor(UIColor.white.cgColor)
        ctx.fillPath()
        
        let rect0 = CGRect(x: rect0X, y: rect0Y, width: innerWidth, height: innerHeight * heightPercent[0])
        let clipPath0: CGPath = UIBezierPath(roundedRect: rect0, cornerRadius: InCornerRadius).cgPath
        ctx.addPath(clipPath0)
        ctx.setFillColor(colors[0])
        ctx.fillPath()
        
        let rect1 = CGRect(x: rect1X, y: rect1Y, width: innerWidth, height: innerHeight * heightPercent[1])
        let clipPath1: CGPath = UIBezierPath(roundedRect: rect1, cornerRadius: 0).cgPath
        ctx.addPath(clipPath1)
        ctx.setFillColor(colors[1])
        ctx.fillPath()
        
        let rect2 = CGRect(x: rect2X, y: rect2Y, width: innerWidth, height: innerHeight * heightPercent[2])
        let clipPath2: CGPath = UIBezierPath(roundedRect: rect2, cornerRadius: 0).cgPath
        ctx.addPath(clipPath2)
        ctx.setFillColor(colors[2])
        ctx.fillPath()
        
        let rect3 = CGRect(x: rect3X, y: rect3Y, width: innerWidth, height: innerHeight * heightPercent[3])
        let clipPath3: CGPath = UIBezierPath(roundedRect: rect3, cornerRadius: InCornerRadius).cgPath
        ctx.addPath(clipPath3)
        ctx.setFillColor(colors[3])
        ctx.fillPath()
    }
}

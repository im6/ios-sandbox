import UIKit

class ColorDetailViewController: UIViewController {
    @IBOutlet weak var colorCanvas: ColorCanvasView!
    var color: VPColor!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        let convFn = Shared.sharedInstance.convertStringToColor
        colorCanvas.colors = [
            convFn(color.color[0]).cgColor,
            convFn(color.color[1]).cgColor,
            convFn(color.color[2]).cgColor,
            convFn(color.color[3]).cgColor,
        ]
    }

}

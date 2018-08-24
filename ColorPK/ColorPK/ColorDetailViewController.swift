import UIKit

class ColorDetailViewController: UIViewController {
    @IBOutlet weak var colorCanvas: ColorCanvasView!
    var color: VPColor!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        colorCanvas.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(switchColor(_:))))
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
    
    @objc func switchColor(_ recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            print(234)
        default:
            print("default")
        }
    }

}

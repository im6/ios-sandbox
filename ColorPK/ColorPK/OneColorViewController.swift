//
//  OneColorViewController.swift
//  ColorPK
//
//  Created by Zijian Guo on 7/1/18.
//  Copyright © 2018 Zijian Guo. All rights reserved.
//

import UIKit

class OneColorViewController: UIViewController {

    var currentColor: VPColor!
    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("one color loaded")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("selected id: \(currentColor.id)")
        testLabel.text = String(currentColor.id)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

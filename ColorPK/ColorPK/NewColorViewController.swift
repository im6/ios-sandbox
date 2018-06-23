//
//  NewColorViewController.swift
//  ColorPK
//
//  Created by Zijian Guo on 6/23/18.
//  Copyright © 2018 Zijian Guo. All rights reserved.
//

import UIKit

class NewColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("New Color panel Loaded")
        testLabel.text = "check"

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var testLabel: UILabel!
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

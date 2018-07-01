//
//  ColorListViewController.swift
//  ColorPK
//
//  Created by Zijian Guo on 7/1/18.
//  Copyright © 2018 Zijian Guo. All rights reserved.
//

import UIKit

class ColorListViewController: UIViewController {
    
    private var colorList: [VPColor] = VPColor.getDummyColorList()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("list load")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showOneColor" {
            let destCtr = segue.destination
            if let oneColorCtr = destCtr as? OneColorViewController {
                oneColorCtr.currentColor = colorList[2]
            }
        }
    }

}

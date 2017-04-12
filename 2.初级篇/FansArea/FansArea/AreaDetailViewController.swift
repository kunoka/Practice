//
//  AreaDetailViewController.swift
//  FansArea
//
//  Created by harry on 12/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit

class AreaDetailViewController: UIViewController {
    var areaName : Area!

    @IBOutlet weak var areaImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        areaImageView.image = UIImage(named: areaName.image)

        // Do any additional setup after loading the view.
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

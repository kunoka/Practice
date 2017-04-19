//
//  ContentViewController.swift
//  FansArea
//
//  Created by harry on 19/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var labelHeading: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelFooter: UILabel!
    
    var index = 0
    var heading = ""
    var imageName = ""
    var footer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelHeading.text = heading
        imageView.image = UIImage(named: imageName)
        labelFooter.text = footer
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

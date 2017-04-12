//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by harry on 11/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touch(_ sender: UIButton) {
        print ("您按了这个按钮")
    
        let ac = UIAlertController(title: "提示", message: "您点击了按钮", preferredStyle: .actionSheet)
        
        let btn = UIAlertAction(title: "好", style: .default, handler: nil)
        
        ac.addAction(btn)
        self.present(ac, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


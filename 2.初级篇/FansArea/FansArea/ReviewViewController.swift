//
//  ReviewViewController.swift
//  FansArea
//
//  Created by harry on 16/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    var rating: String?
    
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBAction func ratingBtnTap(_ sender: UIButton) {
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 200:
            rating = "good"
        case 300:
            rating = "great"
        default:
            break
        }
        performSegue(withIdentifier: "unwindToDetailView", sender: self)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let effect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = view.frame
        bgImageView.addSubview(effectView)
        
        // Stack View animate
        let startPos = CGAffineTransform(translationX: 0, y: 500)
        let startScale = CGAffineTransform(scaleX: 0, y: 0)
     

         ratingStackView.transform = startScale.concatenating(startPos)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.ratingStackView.transform = CGAffineTransform.identity        }
        
//        UIView.animate(withDuration: 0.3) { 
//            self.ratingStackView.transform = CGAffineTransform.identity
//        }
        
//        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
//            let endScale = CGAffineTransform.identity
//            let endPos = CGAffineTransform(scaleX: 0, y: 0)
//            self.ratingStackView.transform = endPos.concatenating(endScale)
//        }, completion: nil)
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

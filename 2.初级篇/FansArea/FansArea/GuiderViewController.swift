//
//  GuiderViewController.swift
//  FansArea
//
//  Created by harry on 19/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit
    
class GuiderViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var headings = ["Swift 3", "iOS 10", "零基础"]
    var images = ["swift", "iOS", "beginner"]
    var footers = ["Swift 3语法适配，超人一步", "iOS 10版本新特性，马上学习", "无需储备知识，新手也能轻松入门"]
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        
        return vc(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index -= 1
        return vc(atIndex: index)
    }

    func vc(atIndex: Int) -> ContentViewController? {
        if case 0..<headings.count = atIndex { // 判断index是否在合理的区间内Swift的 if case 语句
            // 使用 instantiateViewController 方法来初始化一个有 Storyboard ID 的控制器
            if let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentController")
            as? ContentViewController {
                //  成功则传递相应数据
                contentVC.heading = headings[atIndex]
                contentVC.footer = footers[atIndex]
                contentVC.imageName = images[atIndex]
                contentVC.index = atIndex
                
                return contentVC
            }
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置翻页控制器的数据源为自身
        dataSource = self
        // 创建第一个页面控制器
        if let startVC = vc(atIndex: 0) {
            setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
        
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

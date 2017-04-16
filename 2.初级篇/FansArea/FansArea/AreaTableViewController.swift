//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by harry on 11/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {

   var areas = [
    Area(name: "闵行区莘庄镇卡尼曼路711弄东区新天地21号405", province: "上海", part: "华东", image: "xinzhuang", isvisited: false) ,
    Area(name: "兰州七里河区彭家坪路36号兰州理工大学西校区计算机系", province: "甘肃", part: "西北", image: "qilihe", isvisited: false) ,
    Area(name: "三明市龙溪县东旭家园83号楼", province: "福建", part: "东南", image: "youxi", isvisited: false) ,
    Area(name: "西宁城西区香格里拉路昆仑阳光城5号楼", province: "青海", part: "西北", image: "chengxi", isvisited: false) ,
    Area(name: "广州白云区黄石东路江夏东二街200号（地铁2号线江夏站C出口往右约200米）欧陆公园", province: "广东", part: "华南", image: "baiyun", isvisited: false) ,
    Area(name: "闽侯县上街镇工银路更好路祝福坊", province: "福建", part: "东南", image: "shangjie", isvisited: false) ,
    Area(name: "哈尔滨市南岗区嵩山路126号中植方舟苑1102", province: "黑龙江", part: "东北", image: "nangang", isvisited: false) ,
    Area(name: "临汾市尧都区解放东路与姚仙路交汇处恒安新东城逸景40栋3001", province: "山西", part: "西北", image: "yaodu", isvisited: false) ,
    Area(name: "成都武侯区丽都路2号置信花园15号1004", province: "四川", part: "西南", image: "wuhou", isvisited: false) ,
    Area(name: "汕头市金平区汕樟路16号（中山路与油柑路转角）凯悦华庭3号805", province: "广东", part: "华南", image: "jinping", isvisited: false) ,
    Area(name: "长沙市芙蓉区车站北路225号芙蓉园西区9号楼1311", province: "湖南", part: "华中", image: "furong", isvisited: false)
    ]
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    var areas = ["闵行区莘庄镇","兰州七里河区","三明市龙溪县","西宁城西区","广州白云区","闽侯县上街镇","哈尔滨市南岗区","临汾市尧都区","成都武侯区","汕头市金平区","长沙市芙蓉区"]
//    var areaImages = ["xinzhuang","qilihe","youxi","chengxi","baiyun","shangjie","nangang","yaodu","wuhou","jinping","furong"]
//    var provinces = ["上海","甘肃","福建","青海","广东","福建","黑龙江","山西","四川","广东","湖南"]
//    var parts = ["华南","西北","东南","西北","华南","东南","东北","西北","西南","华南","华中"]
//    var visited = [Bool](repeatElement(false, count: 11))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // 设置自动行高
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data delegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionShare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let actionSheet = UIAlertController(title: "分享", message: nil, preferredStyle: .actionSheet)
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "微信", style: .default, handler: nil)
            
            let optionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            actionSheet.addAction(option1)
            actionSheet.addAction(option2)
            actionSheet.addAction(optionCancel)
            
            self.present(actionSheet, animated: true, completion: nil)
        
        }
        actionShare.backgroundColor = UIColor.orange
        let actionDel = UITableViewRowAction(style: .destructive, title: "删除") { (_, indexPath) in
            self.areas.remove(at: indexPath.row)
//            self.areaImages.remove(at: indexPath.row)
//            self.areas.remove(at: indexPath.row)
//            self.provinces.remove(at: indexPath.row)
//            self.parts.remove(at: indexPath.row)
//            self.visited.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let actionTop = UITableViewRowAction(style: .default, title: "置顶") { (_, indexPath) in
        }
        actionTop.backgroundColor = UIColor(red: 126/255, green: 251/255, blue: 165/255, alpha: 1)
        return [actionShare, actionDel, actionTop]
    }
    /*
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("你点击了第", indexPath.section,"组，第几", indexPath.row,"行")
        let menu = UIAlertController(title: "提示", message: "你选择了第\(indexPath.row)行", preferredStyle: .actionSheet)
//        let optionOK1 = UIAlertAction(title: "确定", style: .default, handler: nil)
        let optionOK2 = UIAlertAction(title: "取消", style: .cancel) { (_) in
            print("您取消了第",indexPath.row,"行")
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
            self.visited[indexPath.row] = false
//            cell.visitImageView.image = UIImage(named: "")
            cell.visitImageView.isHidden = !self.visited[indexPath.row]

//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .none
        }
        let optionOK3 = UIAlertAction(title: "我去过", style: .default) { (_) in
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
           
//            cell?.accessoryType = .checkmark
            self.visited[indexPath.row] = true
            cell.visitImageView.isHidden = !self.visited[indexPath.row]
//            cell.visitImageView.image = UIImage(named: "heart")
        }
//        menu.addAction(optionOK1)
        menu.addAction(optionOK2)
        menu.addAction(optionOK3)
        self.present(menu, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
*/
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        // Configure the cell...
        cell.nameLabel?.text = areas[indexPath.row].name
        cell.provinceLabel?.text = areas[indexPath.row].province
        cell.partLabel?.text = areas[indexPath.row].part
        cell.thumbImageView.image = UIImage(named: areas[indexPath.row].image)
        cell.thumbImageView.layer.cornerRadius = cell.thumbImageView.frame.size.height / 2
        cell.thumbImageView.clipsToBounds = true
        
        cell.visitImageView.image = UIImage(named: "heart")
        cell.visitImageView.isHidden = !areas[indexPath.row].isvisited
//        
//        if visited[indexPath.row] {
//            cell.visitImageView.isHidden = false
////            cell.accessoryType = .checkmark
//        } else {
//            cell.visitImageView.image = UIImage(named: "")
////            cell.accessoryType = .none
//        }
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.areas.remove(at: indexPath.row)
//            self.areaImages.remove(at: indexPath.row)
//            self.areas.remove(at: indexPath.row)
//            self.provinces.remove(at: indexPath.row)
//            self.parts.remove(at: indexPath.row)
//            self.visited.remove(at: indexPath.row)
            
            print("删除一行后还剩的区域数目: ", self.areas.count)
            for area in areas {
                print (area)
            }
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAreaDetail" {
            let dest = segue.destination as! DetailTableViewController
            dest.area = areas[tableView.indexPathForSelectedRow!.row]
        }
    }
 

}

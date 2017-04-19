//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by harry on 11/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit
import CoreData

class AreaTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchResultsUpdating {

    var areas: [AreaMO] = []
    var fc: NSFetchedResultsController<AreaMO>!
    var sc: UISearchController!
    var searchResult: [AreaMO] = [] // 定义一个空数组以保存搜索结果
    
    func searchFilter(text: String) { //要搜索的文字
       searchResult = areas.filter({ (area) -> Bool in
        return area.name!.localizedCaseInsensitiveContains(text)
       })
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    var areas = ["闵行区莘庄镇","兰州七里河区","三明市龙溪县","西宁城西区","广州白云区","闽侯县上街镇","哈尔滨市南岗区","临汾市尧都区","成都武侯区","汕头市金平区","长沙市芙蓉区"]
//    var areaImages = ["xinzhuang","qilihe","youxi","chengxi","baiyun","shangjie","nangang","yaodu","wuhou","jinping","furong"]
//    var provinces = ["上海","甘肃","福建","青海","广东","福建","黑龙江","山西","四川","广东","湖南"]
//    var parts = ["华南","西北","东南","西北","华南","东南","东北","西北","西南","华南","华中"]
//    var visited = [Bool](repeatElement(false, count: 11))
    
    func updateSearchResults(for searchController: UISearchController) {
        if var text = searchController.searchBar.text {
            text = text.trimmingCharacters(in: .whitespaces)
            searchFilter(text: text)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        tableView.tableHeaderView = sc.searchBar
        sc.dimsBackgroundDuringPresentation = false //可以点击
        sc.searchBar.tintColor = UIColor.white
//        sc.searchBar.barTintColor = UIColor.orange
        sc.searchBar.placeholder = "输入地区名进行搜索。。。"
        sc.searchBar.searchBarStyle = .minimal //透明
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // 设置自动行高
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        fetchAllData2()
    }
    // 即将发生变化
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    // 变更处理完
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    // 正在变化之中
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type { // 变化类型
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        default:
            tableView.reloadData()
        }
        if let object = controller.fetchedObjects {
            areas = object as! [AreaMO]
        }
    }
    
    func fetchAllData2() {
        // 请求结果类型是 AreaMO
        let request: NSFetchRequest<AreaMO> = AreaMO.fetchRequest() //获取全部数据
        let sd = NSSortDescriptor(key: "name", ascending: true) // NSSortDescriptor 指定请求结果如何排序
        request.sortDescriptors = [sd]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        // NSFetchedResultsController初始化后，指定代理
        fc = NSFetchedResultsController(fetchRequest: request , managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fc.delegate = self
        
        do {
            try fc.performFetch()
            if let objects = fc.fetchedObjects {
                // 执行查询，把结果保存到数组中
                areas = objects
            }
        } catch{
            print(error)
        }
        
    }
    
//    func fetchAllData() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        // do, try, catch 错误处理
//        do {
//            // 获取AreaMO此Entity的所有条目
//            areas = try appDelegate.persistentContainer.viewContext.fetch(AreaMO.fetchRequest())
//        } catch {
//            print(error)
//        }
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        fetchAllData()
//        tableView.reloadData()
        print("<<<<<<<<<<< viewDidAppear 1 >>>>>>>>>>>>>>")
        if let pageVC = storyboard?.instantiateViewController(withIdentifier: "GuideController") as?  GuiderViewController {
            print("<<<<<<<<<<< viewDidAppear 2 >>>>>>>>>>>>>>")
            present(pageVC, animated: true, completion: nil)
        }
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
//            self.areas.remove(at: indexPath.row)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            context.delete(self.fc.object(at: indexPath))
            appDelegate.saveContext()
            
//            self.areaImages.remove(at: indexPath.row)
//            self.areas.remove(at: indexPath.row)
//            self.provinces.remove(at: indexPath.row)
//            self.parts.remove(at: indexPath.row)
//            self.visited.remove(at: indexPath.row)
            
//            tableView.deleteRows(at: [indexPath], with: .fade)
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
        return sc.isActive ? searchResult.count : areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        let area = sc.isActive ? searchResult[indexPath.row] : areas[indexPath.row]
        // Configure the cell...
        cell.nameLabel?.text = area.name
        cell.provinceLabel?.text = area.province
        cell.partLabel?.text = area.part
        cell.thumbImageView.image = UIImage(data: area.image! as Data)
        cell.thumbImageView.layer.cornerRadius = cell.thumbImageView.frame.size.height / 2
        // 如果子视图的范围超出了父视图的边界，那么超出的部分就会被裁剪掉
        cell.thumbImageView.clipsToBounds = true
        
        cell.visitImageView.image = UIImage(named: "heart")
//        cell.visitImageView.isHidden = !areas[indexPath.row].isvisited
        cell.visitImageView.isHidden = true
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
 

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return !sc.isActive
    }

    
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

    @IBAction func close(segue: UIStoryboardSegue) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAreaDetail" {
            let dest = segue.destination as! DetailTableViewController
            dest.area = sc.isActive ? searchResult[tableView.indexPathForSelectedRow!.row] :  areas[tableView.indexPathForSelectedRow!.row]
        }
    }
 

}

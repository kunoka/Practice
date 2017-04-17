//
//  AddAreaController.swift
//  FansArea
//
//  Created by harry on 17/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit

class AddAreaController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var coverImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 当用户选择一张照片，触发这个方法
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        coverImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        coverImageView.contentMode = .scaleAspectFill //填充整个图片
        coverImageView.clipsToBounds = true //裁边
        
        let coverWidthCons = NSLayoutConstraint(item: coverImageView, attribute: .width, relatedBy: .equal, toItem: coverImageView.superview, attribute: .width, multiplier: 1, constant: 0) // multiplier:1倍
        let coverHeightCons = NSLayoutConstraint(item: coverImageView, attribute: .height, relatedBy: .equal, toItem: coverImageView.superview, attribute: .height, multiplier: 1, constant: 0)
        coverWidthCons.isActive = true
        coverHeightCons.isActive = true
        dismiss(animated: true , completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            // guard 保证条件是否成立
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                print("相册不可用")
                return
            }
            let picker = UIImagePickerController()
            picker.allowsEditing = false // 不允许编辑相册
            picker.sourceType = .photoLibrary // 类型是枚举属性，打个点就会出来
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

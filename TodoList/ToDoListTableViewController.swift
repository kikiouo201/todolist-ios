//
//  ToDoListTableViewController.swift
//  TodoList
//
//  Created by 楊惠文 on 2020/12/10.
//  Copyright © 2020 楊惠文. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    
    var itemList = ["讀日文", "eat food"]
    var modifyItemList : [String]?
    @IBOutlet weak var ItemTableView: UITableView!
    
    
    //go to AddItemView
    @IBAction func segueAddItemView(_ sender: UIButton) {
        self.performSegue(withIdentifier:"AddItem", sender: sender.tag)
    }
    
// 跳到特定頁面
//    @IBAction func method3Clicked(_ sender: Any) {
//        let sb = UIStoryboard(name: "AddItem", bundle: nil)
//        let vc = sb.instantiateViewController( withIdentifier: "AddItemView") as! AddItemViewController
//        vc.itemList = itemList
//        vc.fixItemIndex = nil
//         self.present(vc, animated: true, completion: nil)
//
//    }

    // complete Item
    @IBAction func completeItem(_ sender: UIButton) {
       
        if let imageFromButton = sender.image(for: UIControl.State.normal)   {
            sender.setImage(UIImage(named:"check.png"), for: .normal)
            if imageFromButton == UIImage(named:"blank-check-box.png") {
                sender.setImage(UIImage(named:"check.png"), for: .normal)
            }
            if imageFromButton ==  UIImage(named:"check.png") {
                sender.setImage(UIImage(named:"blank-check-box.png"), for: .normal)
            }
        }

        
    }
    //完成Ｏｋ
    //存下 傳過來的東西 ＯＫ
    //滑動 跳過去修改和刪除 ok
    //短按 完成待辦事項 ok
    //關掉打開還是有一樣的事項
    // 導覽行 和 ＋ addItem OK
    // 加到導覽列中 OK
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
      // 傳過來的值
        if let beforeItemList = UserDefaults.standard.array(forKey: "itemList") as? [String] {
            itemList = beforeItemList
//            print("beforeItemList")
//            print(itemList)
        }
        
        if let modifyItemList = modifyItemList{
            itemList = modifyItemList
//            print(itemList)
            // 加入臨時儲存 讓程式重新執行可獲得原本數據
             UserDefaults.standard.set(itemList, forKey: "itemList")
        }
        
       
        // hide Back button
       self.navigationItem.hidesBackButton = true;
        // add "Add" Button
       self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(segueAddItemView))


    }
    


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // segue 設定傳到哪裡和傳什麼值過去
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let vc = segue.destination as? AddItemViewController
            vc?.itemList = itemList
            vc?.fixItemIndex = nil
            if let indexPath = self.ItemTableView.indexPathForSelectedRow?.row {
                
                vc?.fixItemIndex = indexPath
            }
        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.count
    }
    
   // 每個 cell 的設定
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let celIdentifer = "item"

    let cell = tableView.dequeueReusableCell(withIdentifier: celIdentifer, for: indexPath) as! TodoListTableViewCell
    
   
    
    cell.itemName?.text = itemList[indexPath.row]
    tableView.tableFooterView = UIView(frame: .zero)
    
    
    tableView.frame = CGRect(x: -10, y: (self.tableView?.frame.origin.y)!, width: (self.tableView?.frame.size.width)!, height: (self.tableView?.frame.size.height)!-20)
    return cell
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // cell 往右滑 按刪除鍵
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the row from the data source
           // tableView.deleteRows(at: [indexPath], with: .fade)
            itemList.remove(at: indexPath.row)
            for i in itemList{
                print(i)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        tableView.reloadData()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

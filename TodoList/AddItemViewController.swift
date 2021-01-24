//
//  AddItemViewController.swift
//  TodoList
//
//  Created by 楊惠文 on 2020/12/24.
//  Copyright © 2020 楊惠文. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    
    
   

    @IBOutlet weak var itemName: UITextField!
    var fixItemIndex: Int?
    var itemList: [String]?
    //var programVar : Program?
    override func viewDidLoad() {
        super.viewDidLoad()

        // 傳過來的值
        if let itemList = itemList{
            if let fixItemIndex = fixItemIndex{
                itemName.text = itemList[fixItemIndex]
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
//    @IBAction func addItem(_ sender: UIButton) {
//        if let verifcationId = seid{
//           sender.setTitle(verifcationId, for: .normal)
//        }
//       
//    
//    }
//    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let text = self.itemName.text else {
            print("oops")
            return
        }
        let vc = segue.destination as? ToDoListTableViewController
        if var itemList = itemList{

            if let fixItemIndex = fixItemIndex{
                itemList[fixItemIndex] = text
                vc?.modifyItemList = itemList
            }else{
                itemList.append(text)
                 vc?.modifyItemList = itemList


            }
        }
     
       
      
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

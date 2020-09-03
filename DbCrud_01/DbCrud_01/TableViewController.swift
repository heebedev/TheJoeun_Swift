//
//  TableViewController.swift
//  DbCrud_01
//
//  Created by 김승희 on 2020/09/03.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, QueryModelProtocol{
    
    var feedItem: NSArray = NSArray()
    var dbModels = [DBModel]()

    @IBOutlet var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self

        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
    }
    
    func itemDownloaded(items: NSArray) {
        feedItem = items
        self.listTableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) { // 입력 후 DB에서 다시 읽어들이기
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        let item: DBModel = feedItem[indexPath.row] as! DBModel   //DBmodel 타입으로 바꾸는것.. as! DBModel..
        
        cell.textLabel?.text = "성명 : \(item.sname!)"
        cell.detailTextLabel?.text = "학번 : \(item.scode!)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.listTableView.indexPath(for: cell)
            
            let detailView = segue.destination as! DetailViewController
            
            let item: DBModel = feedItem[indexPath!.row] as! DBModel
            
            let code = String(item.scode!)
            let name = String(item.sname!)
            let dept = String(item.sdept!)
            let phone = String(item.sphone!)
            
            detailView.receiveItems(code, name, dept, phone)
            
            
        }
        
    }
    

}

//
//  TableViewController.swift
//  Table
//
//  Created by Songhee Choi on 2020/08/28.
//  Copyright © 2020 Songhee Choi. All rights reserved.
//

import UIKit

// 데이터 : 클래스 밖에서 변수를 선언하면 다른 클래스에서도 사용 가능
var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]




class TableViewController: UITableViewController {

    // 아웃렛 연결 //
    @IBOutlet var tvListView: UITableView! // table view 부분 선택하고 연결하기
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // Edit 버튼 : right -> left 로 변경
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    
    // MARK: - Table view data source // 미니맵에서 한눈에 확인 가능

    // 테이블 하나 당 Section의 갯수?
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 섹션당 열의 갯수 : itmes의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count // 배열 갯수만큼 보이게
    }

    // cell 화면에 나올 내용 세팅
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //withIdentifier: "myCell" 은 cell 선택하고 설정해놓은 identifier,            indexPath(내용 index)
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...

        // item 세팅
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row] // 글자
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row]) // 이미지
       
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
    // 삭제 할때
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            
            tableView.deleteRows(at: [indexPath], with: .fade) // 지워줌
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   
    
    // 삭제시 Delete를 삭제(한글)로 바꿔주기:  추가
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    // 테이블 목록 순서 바꾸기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 item의 이동 전 위치
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        
        // 이동할 image의 위치
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        
        // 이동 알고리즘: 이동 item선택 > item 현재 index 삭제 > 이동 한 index 삽입 (재정렬)
        // 이동할 item을 삭제
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        
        // 삭제된 item을 이동할 위치로 삽입하면 index가 재 정렬됨
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation

    // Detail 내용  (segue) 에서 보기
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell) // 몇번쨰 클릭했는지 가져옴
            let detailView = segue.destination as! DetailViewController
            
            detailView.receiveItems(items[(indexPath! as NSIndexPath).row]) // 클릭한 아이템 보냄!
            
        }
        
    }
   
    
    //추가: 배열에 추가된 데이터를 전부 불러오기 // 다시 불러와야 추가된 데이터를 다시 불러와서 볼 수 있음.
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }

}//---------

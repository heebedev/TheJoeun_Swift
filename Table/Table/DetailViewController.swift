//
//  DetailViewController.swift
//  Table
//
//  Created by Songhee Choi on 2020/08/28.
//  Copyright © 2020 Songhee Choi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 아웃렛 연결 //
    @IBOutlet weak var lblItem: UILabel!
    
    // 전역 변수 //
    var receiveItem = "" // cell 선택 후 받은 아이템
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        lblItem.text = receiveItem 
    }
    
    func receiveItems(_ item: String){ // table View에서 받은 item
        receiveItem = item // receiveItem에 넣어줌
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

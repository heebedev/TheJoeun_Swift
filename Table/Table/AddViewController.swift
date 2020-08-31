//
//  AddViewController.swift
//  Table
//
//  Created by Songhee Choi on 2020/08/28.
//  Copyright © 2020 Songhee Choi. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    // 아웃렛 연결 //
    @IBOutlet weak var tfAddItem: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // 액션 //
    // Add 버튼
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!) // 바로 tableViewController에 정의해놓은 배열에 추가됨!
        itemsImageFile.append("clock.png") // 임의 설정
        tfAddItem.text = "" // 초기화
        
        navigationController?.popViewController(animated: true) // 버튼 누르면 제거하고 앞으로 돌아감 // 받는놈한테 받게 설정해주러감 

    }
    
    
    
    
}

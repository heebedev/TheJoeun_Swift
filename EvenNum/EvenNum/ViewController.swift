//
//  ViewController.swift
//  EvenNum
//
//  Created by ZZEUNG on 24/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnCheck(_ sender: UIButton) {
        
        
        if let num:Int = Int(inputNum.text!) {
            lbResult.text = "입력한 숫자는 \(checkEvenOdd(num: num))입니다."
        } else {
            lbResult.text = "숫자를 입력해주세요."
        }
        
    }
    
    func checkEvenOdd(num:Int) -> String {
        if num % 2 == 0 {
            return "짝수"
        } else {
            return "홀수"
        }
    }
}


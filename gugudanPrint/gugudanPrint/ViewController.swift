//
//  ViewController.swift
//  gugudanPrint
//
//  Created by ZZEUNG on 24/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var danInput: UITextField!
    @IBOutlet weak var danResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func danPrint(_ sender: UIButton) {
        if let dan:Int = Int(danInput.text!) {
            danResult.text = ""
            for i in 1...9 {
                danResult.text += String(format: "%d X %d = %5d \n", dan, i, dan*i)
            }
        } else {
            danResult.text = "단을 입력해주세요."
        }
        
    }
    
}


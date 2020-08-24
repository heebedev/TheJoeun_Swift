//
//  ViewController.swift
//  HelloWorld
//
//  Created by ZZEUNG on 24/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var check:Int = 0

    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnName(_ sender: UIButton) {
        if check == 0 {
            lblWelcome.text = "Welcome! 김승희"
            check = 1
        } else {
            lblWelcome.text = "Welcome!"
            check = 0
        }
        
    }
    
    
}


//
//  ViewController.swift
//  TextName
//
//  Created by ZZEUNG on 24/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lbWelcome: UILabel!
    @IBOutlet weak var tfNAme: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
   
    @IBAction func btnName(_ sender: UIButton) {
        lbWelcome.text = "Welcome! " + tfNAme.text!
    }
    
}


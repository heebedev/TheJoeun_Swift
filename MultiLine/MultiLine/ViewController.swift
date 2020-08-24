//
//  ViewController.swift
//  MultiLine
//
//  Created by ZZEUNG on 24/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnAdd(_ sender: UIButton) {
        tvResult.text += txtInput.text! + "\n"
        
    }
}


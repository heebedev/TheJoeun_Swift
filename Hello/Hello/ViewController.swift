//
//  ViewController.swift
//  Hello
//
//  Created by ZZEUNG on 20/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        strHello.text = "안녕하세요"
        
    }

}


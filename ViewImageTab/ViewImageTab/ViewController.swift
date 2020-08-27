//
//  ViewController.swift
//  ViewImageTab
//
//  Created by ZZEUNG on 27/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGoSelecButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
        
    }
    
    @IBAction func btnGoSelecTimer(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
        
    }
    
    @IBAction func btnGoSelecPgCtrl(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
        
    }
    
    
}


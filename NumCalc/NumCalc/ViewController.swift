//
//  ViewController.swift
//  NumCalc
//
//  Created by ZZEUNG on 24/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    
    @IBOutlet weak var addResult: UILabel!
    @IBOutlet weak var subResult: UILabel!
    @IBOutlet weak var mulResult: UILabel!
    @IBOutlet weak var divResult: UILabel!
    @IBOutlet weak var divRemain: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnCalc(_ sender: Any) {
        
        var tempCalc:Int = 0
        let firNum:Int = Int(firstNum.text!)!
        let secNum:Int = Int(secondNum.text!)!
        
        tempCalc = firNum + secNum
        addResult.text = "\(tempCalc)"
        tempCalc = firNum - secNum
        subResult.text = "\(tempCalc)"
        tempCalc = firNum * secNum
        mulResult.text = "\(tempCalc)"
        tempCalc = firNum / secNum
        divResult.text = "\(tempCalc)"
        tempCalc = firNum % secNum
        divRemain.text = "\(tempCalc)"
        
        
    }
    

}


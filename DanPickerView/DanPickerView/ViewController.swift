//
//  ViewController.swift
//  DanPickerView
//
//  Created by ZZEUNG on 25/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var lbDanSelected: UILabel!
    @IBOutlet weak var danPickerView: UIPickerView!
    @IBOutlet weak var resultTextView: UITextView!
    
    let MAX_ARRAY_NUM = 8
    let PICKER_VIEW_COLUMN = 1
    let danNum = Array<Int>(2...9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbDanSelected.text = String(danNum[0]) + " 단"
        printDan(danNum[0])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return danNum.count
    }

    //string of title in each component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(danNum[row]) + " 단"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultTextView.text = ""
        lbDanSelected.text = String(danNum[row]) + " 단"
        printDan(danNum[row])
    }
    
    func printDan(_ num: Int) {
        for i in 1...9 {
            resultTextView.text += String(format: "%d X %d = %3d \n", num, i, num*i)
        }
        
    }

    
}


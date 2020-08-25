//
//  ViewController.swift
//  datePickerAlarm
//
//  Created by ZZEUNG on 25/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNow: UILabel!
    @IBOutlet weak var lbSelected: UILabel!
    
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var timenow:String = ""
    var timeselec:String = ""
    var count:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDPick(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        timeselec = formatter.string(from: datePickerView.date)
        lbSelected.text = "선택 시간 : " + timeselec
        count = 0
    }
    
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        timenow = formatter.string(from: date as Date)
        lbNow.text = "현재 시간 : " + timenow
        if (timenow == timeselec && count%2 == 0 && count <= 10) {
            count += 1
            view.backgroundColor = UIColor.red
        } else if (timenow == timeselec && count <= 10){
            count += 1
            view.backgroundColor = UIColor.blue
        } else {
            view.backgroundColor = UIColor.white
        }
        
    }
    

}


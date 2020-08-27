//
//  ViewController.swift
//  DatePicker
//
//  Created by ZZEUNG on 25/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var lblPickerTime: UILabel!
    @IBOutlet weak var lblCurrentTime: UILabel!
    
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        //async multi tasking을 구현한 것이다.
    }
}


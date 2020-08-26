//
//  ViewController.swift
//  alramAlert
//
//  Created by ZZEUNG on 26/08/2020.
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
    var alerted :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

   
    @IBAction func dateChangePick(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        timeselec = formatter.string(from: datePickerView.date)
        lbSelected.text = "선택 시간 : " + timeselec
        alerted = false
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        timenow = formatter.string(from: date as Date)
        lbNow.text = "현재 시간 : " + timenow
        if (timenow == timeselec && alerted == false) {
            let alramAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!!", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {Action in
                self.view.backgroundColor = UIColor.white
            })
            view.backgroundColor = UIColor.red
            alerted = true
            alramAlert.addAction(alertAction)
            present(alramAlert, animated: true, completion: nil)
        }
        
    }
}


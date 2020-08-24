//
//  ViewController.swift
//  scoreSummary
//
//  Created by ZZEUNG on 24/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbSubject: UILabel!
    @IBOutlet weak var txtScore: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResult1: UILabel!
    @IBOutlet weak var lbResult2: UILabel!
    @IBOutlet weak var lbResult3: UILabel!
    @IBOutlet weak var lbResult4: UILabel!
    
    var scores:Array<Double> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnOK(_ sender: Any) {
        if let num:Double = Double(txtScore.text!) {
            checkResult(num: num)
        } else {
            lbResult.text = "점수를 입력해주세요."
        }
    }
    
    func checkResult(num:Double) {
        switch lbSubject.text! {
        case "국어 점수":
            scores.append(num)
            lbSubject.text = "영어 점수"
            txtScore.text = ""
        case "영어 점수":
            scores.append(num)
            lbSubject.text = "수학 점수"
            txtScore.text = ""
        case "수학 점수":
            scores.append(num)
            lbSubject.text = "점수 입력 완료"
            txtScore.isHidden = true
            
            let total = scores[0] + scores[1] + scores[2]
            let avg = total/3
                
            lbResult.text = "총점은 \(total) 점 입니다."
            lbResult1.text = "평균은 \(avg)입니다."
            lbResult2.text = "국어 점수는 \(checkResult(scores[0], avg))니다."
            lbResult3.text = "영어 점수는 \(checkResult(scores[1], avg))니다."
            lbResult4.text = "수학 점수는 \(checkResult(scores[2], avg))니다."
        default :
            txtScore.isHidden = false
            txtScore.text = ""
            lbResult.text = ""
            lbResult1.text = ""
            lbResult2.text = ""
            lbResult3.text = ""
            lbResult4.text = ""
            lbSubject.text = "국어 점수"
            scores.removeAll()
            
        }
    }
    
    func checkResult(_ num:Double, _ avg:Double) -> String {
        if num > avg {
            return "평균보다 높습"
        } else if num == avg {
            return "평균과 동일합"
        } else {
            return "평균보다 낮습"
        }
    }
    
}


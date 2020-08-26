//
//  ViewController.swift
//  randomGugudan
//
//  Created by ZZEUNG on 26/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var tvAnswer: UITextField!
    @IBOutlet weak var resultImage: UIImageView!
    
    var calcNum1:Int = 0
    var calcNum2:Int = 0
    
    let timeSelector: Selector = #selector(ViewController.deleteImage)
    let interval = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickNumber()
        num1.text = String(calcNum1)
        num2.text = String(calcNum2)
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func btnOk(_ sender: UIButton) {
        if Int(tvAnswer.text!) == calcNum1*calcNum2 {
            let okAlert = UIAlertController(title: "결과", message: "맞췄습니다!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "다음문제 진행", style: UIAlertAction.Style.default, handler: {Action in
                
                self.calcNum1 = Int.random(in: 2...9)
                self.calcNum2 = Int.random(in: 1...9)
                self.num1.text = String(self.calcNum1)
                self.num2.text = String(self.calcNum2)
                self.tvAnswer.text = ""
                self.resultImage.image = UIImage(named: "kebizizi.png")

            })
            okAlert.addAction(okAction)
            present(okAlert, animated: true, completion: nil)
        } else {
            let wrongAlert = UIAlertController(title: "결과", message: "다시 생각해볼까요?", preferredStyle: UIAlertController.Style.alert)
            let wrongAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {Action in
                self.tvAnswer.text = ""
                self.resultImage.image = UIImage(named: "kura.png")
                
            })
            wrongAlert.addAction(wrongAction)
            present(wrongAlert, animated: true, completion: nil)
        }
    }
    
    
    func pickNumber() {
        calcNum1 = Int.random(in: 2...9)
        calcNum2 = Int.random(in: 1...9)
    }
    
    @objc func deleteImage() {
        resultImage.image = UIImage()
        
    }
}


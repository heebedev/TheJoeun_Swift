//
//  ViewController.swift
//  PinGesture-02
//
//  Created by ZZEUNG on 27/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ : )))
        self.view.addGestureRecognizer(pinch)
        imgPinch.image = UIImage(named: "flower_03.png")
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1 // 다음 변환을 위한 scale의 속성을 설정
    }

}


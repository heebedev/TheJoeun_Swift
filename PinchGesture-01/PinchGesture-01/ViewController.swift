//
//  ViewController.swift
//  PinchGesture-01
//
//  Created by ZZEUNG on 27/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblApple: UILabel!
    
    var initialFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_: )))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        if pinch.state == UIPinchGestureRecognizer.State.began{
            initialFontSize = lblApple.font.pointSize
        } else {
            lblApple.font = lblApple.font.withSize(initialFontSize * pinch.scale)
        }
    }

}


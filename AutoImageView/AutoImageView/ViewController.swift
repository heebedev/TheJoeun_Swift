//
//  ViewController.swift
//  AutoImageView
//
//  Created by ZZEUNG on 25/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var count:Int = 1
    
    let timeSelector: Selector = #selector(ViewController.updateImage)
    
    let interval = 3.0
    let imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        imgView.image = UIImage(named: imageName[0])
        imgName.text = imageName[0]
    }


    @objc func updateImage() {
        imgView.image = UIImage(named: imageName[count%6])
        imgName.text = imageName[count%6]
        count += 1
    }
    
}


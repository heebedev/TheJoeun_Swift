//
//  ViewController.swift
//  FlowerImg
//
//  Created by ZZEUNG on 25/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var count = 0;
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: imageName[count])
        imgName.text = imageName[count]
    }


    @IBAction func btnBefore(_ sender: UIButton) {
        count -= 1
        if count < 0 {
            count = imageName.count-1
        }
        imageSetting(count: count%6)
    }
    
    @IBAction func btnAfter(_ sender: UIButton) {
        count += 1
        imageSetting(count: count%6)
    }
    
    func imageSetting(count: Int)  {
        imgView.image = UIImage(named: imageName[count])
        imgName.text = imageName[count]
    }
    
}


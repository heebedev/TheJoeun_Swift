//
//  ViewController.swift
//  Kanna_02
//
//  Created by 김승희 on 2020/09/01.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataCrawling()
    }


    func dataCrawling() {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html" )
        let myUrl = URL(fileURLWithPath: filePath!)
        
        do {
            let htmlData = try String(contentsOf: myUrl, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            
            for h in doc.xpath("//h1") {
                print(h.text!)
            }
            print("--------------------------")
            
            for p in doc.xpath("//p") {
                print(p.text!)
            }
            print("--------------------------")
            
            for a in doc.xpath("//a") {
                print(a.text!)
            }
            print("--------------------------")
            
            
        } catch let error {
            print("Error \(error)")
        }
        
    }
}


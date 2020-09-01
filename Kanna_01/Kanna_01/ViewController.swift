//
//  ViewController.swift
//  Kanna_01
//
//  Created by 김승희 on 2020/09/01.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {
    
    let html = """
        <html>
            <body>
                <h1>My First Heading</h1>
                <p>과일 상점 관리</p>
                <a class="mylink" id="applelink" href="http://www.apple.com">Apple</a>
                <ul>
                    <li>사과</li>
                    <li>바나나</li>
                    <li>복숭아</li>
                    <li>포도</li>
                </ul>
            </body>
        </html>
    """

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataCrawling()
    }

    
    func dataCrawling() {
        do {
            let doc = try HTML(html: html, encoding: .utf8)
            //print(doc.text!)
            //print("--------------------------")
            
            //for p in doc.xpath("//p") {
            //    print(p.text!)
            //}
            //print("--------------------------")
            
            for li in doc.xpath("//li") {
                print(li.text!)
            }
            print("--------------------------")
            
        } catch let error {
            print("Error \(error)")
        }
    }

}


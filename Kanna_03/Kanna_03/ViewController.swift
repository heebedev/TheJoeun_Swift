//
//  ViewController.swift
//  Kanna_03
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
        let mainUrl = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
        guard let main = URL(string: mainUrl) else {
            print("Error: \(mainUrl) doesn't seem to be a valid URL")
            return
        }
        
        do {
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            // //*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a    <- Xpath니까 // 로 시작한다.
            
            var count = 1
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a") {
                print(count, ":", title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                count += 1
            }
            print("----------------------------------")
            
        } catch let error {
            print("Error \(error)")
        }
        
    }

}


//
//  MapImgViewController.swift
//  CovidMap
//
//  Created by 김승희 on 2020/09/02.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit

class MapImgViewController: UIViewController, CrawlModelProtocol {
    
    
    @IBOutlet weak var mapImgView: UIImageView!
    @IBOutlet var mainView: UIView!
    var feedItem: NSArray = NSArray()
    var feedItemTotal: NSArray = NSArray()
    var feedItemPlus: NSArray = NSArray()
    var date:String = ""
    
    @IBOutlet weak var name1: UITextView!
    @IBOutlet weak var name2: UITextView!
    @IBOutlet weak var name3: UITextView!
    @IBOutlet weak var name4: UITextView!
    @IBOutlet weak var name5: UITextView!
    @IBOutlet weak var name6: UITextView!
    @IBOutlet weak var name7: UITextView!
    @IBOutlet weak var name8: UITextView!
    @IBOutlet weak var name9: UITextView!
    @IBOutlet weak var name10: UITextView!
    @IBOutlet weak var name11: UITextView!
    @IBOutlet weak var name12: UITextView!
    @IBOutlet weak var name13: UITextView!
    @IBOutlet weak var name14: UITextView!
    @IBOutlet weak var name15: UITextView!
    @IBOutlet weak var name16: UITextView!
    @IBOutlet weak var name17: UITextView!
    @IBOutlet weak var name18: UITextView!
    @IBOutlet weak var lblDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapImgView.image = UIImage(named: "map.jpeg")
        
        let crawlModel = CrawlModel()
        crawlModel.delegate = self
        crawlModel.dataCrawling()
        // Do any additional setup after loading the view.
        
    }
    
    func itemDownloaded(names: NSArray, totals: NSArray, pluses :NSArray, checkDate : String) {
        feedItem = names
        feedItemTotal = totals
        feedItemPlus = pluses
        date = checkDate
        
        name1.text = "\(feedItem[0])\n\(feedItemTotal[0])\n\(feedItemPlus[0])"
        name2.text = "\(feedItem[1])\n\(feedItemTotal[1])\n\(feedItemPlus[1])"
        name3.text = "\(feedItem[2])\n\(feedItemTotal[2])\n\(feedItemPlus[2])"
        name4.text = "\(feedItem[3])\n\(feedItemTotal[3])\n\(feedItemPlus[3])"
        name5.text = "\(feedItem[4])\n\(feedItemTotal[4])\n\(feedItemPlus[4])"
        name6.text = "\(feedItem[5])\n\(feedItemTotal[5])\n\(feedItemPlus[5])"
        name7.text = "\(feedItem[6])\n\(feedItemTotal[6])\n\(feedItemPlus[6])"
        name8.text = "\(feedItem[7])\n\(feedItemTotal[7])\n\(feedItemPlus[7])"
        name9.text = "\(feedItem[8])\n\(feedItemTotal[8])\n\(feedItemPlus[8])"
        name10.text = "\(feedItem[9])\n\(feedItemTotal[9])\n\(feedItemPlus[9])"
        name11.text = "\(feedItem[10])\n\(feedItemTotal[10])\n\(feedItemPlus[10])"
        name12.text = "\(feedItem[11])\n\(feedItemTotal[11])\n\(feedItemPlus[11])"
        name13.text = "\(feedItem[12])\n\(feedItemTotal[12])\n\(feedItemPlus[12])"
        name14.text = "\(feedItem[13])\n\(feedItemTotal[13])\n\(feedItemPlus[13])"
        name15.text = "\(feedItem[14])\n\(feedItemTotal[14])\n\(feedItemPlus[14])"
        name16.text = "\(feedItem[15])\n\(feedItemTotal[15])\n\(feedItemPlus[15])"
        name17.text = "\(feedItem[16])\n\(feedItemTotal[16])\n\(feedItemPlus[16])"
        name18.text = "\(feedItem[17])\n\(feedItemTotal[17])\n\(feedItemPlus[17])"
        lblDate.text = date
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

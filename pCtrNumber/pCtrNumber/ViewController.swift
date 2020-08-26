//
//  ViewController.swift
//  pCtrNumber
//
//  Created by ZZEUNG on 26/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbResultNum: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        checkPage(pageControl.currentPage)
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        checkPage(pageControl.currentPage)
    }
    
    func checkPage(_ pageNum:Int) {
        lbResultNum.text = String(pageNum + 1)
        lbResultNum.textColor = (pageNum+1)%2 == 0 ? UIColor.blue : UIColor.red
        
    }
    
}


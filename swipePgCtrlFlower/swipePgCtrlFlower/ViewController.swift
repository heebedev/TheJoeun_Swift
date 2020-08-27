//
//  ViewController.swift
//  swipePgCtrlFlower
//
//  Created by ZZEUNG on 27/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let imgNames = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 6
        pageControl.currentPage = 0
        imgView.image = UIImage(named: imgNames[0])
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.responseToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.responseToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func responseToSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage -= pageControl.currentPage > 0 ? 1 : -6
                imgView.image = UIImage(named: imgNames[pageControl.currentPage])
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage += pageControl.currentPage == 5 ? -5 : 1
                imgView.image = UIImage(named: imgNames[pageControl.currentPage])
            default: break
            }
        }
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: imgNames[pageControl.currentPage])
    }
    
}


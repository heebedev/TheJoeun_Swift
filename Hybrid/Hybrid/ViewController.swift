//
//  ViewController.swift
//  Hybrid
//
//  Created by ZZEUNG on 26/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivitiIndicator: UIActivityIndicatorView!
    
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        
        //Web View가 Loading 중 인지 확인하기
        myWebView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "loading" {
            if myWebView.isLoading {
                myActivitiIndicator.stopAnimating()
                myActivitiIndicator.isHidden = false
            } else {
                myActivitiIndicator.startAnimating()
                myActivitiIndicator.isHidden = true
            }
        }
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag  {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage(url: "https://www.naver.com")
    }

    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(url: myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage(url: "http://www.google.com")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage(url: "http://www.daum.net")
    }
    
    @IBAction func btnGoTomcat(_ sender: UIButton) {
        loadWebPage(url: "http://localhost:8080/ResponseAge_01.jsp")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = """
            <html>
            <head>
                <meta charset = "utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body>
                <h1> HTML String </h1>
                <p>String 변수를 이용한 웹페이지</p>
                <p><a href = \"http://jtbc.joins.com\">JTBC</a>로 이동</p>
            </body>
            </html>
        """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
        
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnFastFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}


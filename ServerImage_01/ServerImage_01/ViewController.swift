//
//  ViewController.swift
//  ServerImage_01
//
//  Created by 김승희 on 2020/09/02.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgDisplay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnLoadImage(_ sender: UIButton) {
        downloadItems()
    }
    
    func downloadItems() {
        let url = URL(string: "Http://192.168.200.119:8080/Test/img_0214.jpg")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil {
                print("Fail to download data")
            } else {
                print("Data is downloaded")
                DispatchQueue.main.async {
                    self.imgDisplay.image = UIImage(data: data!)
                    // jpg
                    if let image = UIImage(data: data!){
                        if let data = image.jpegData(compressionQuality: 0.8){
                            let filename = self.getDocumentDirectory().appendingPathComponent("copy.jpg")
                            try? data.write(to: filename)
                            print("Data is writed")
                            print(self.getDocumentDirectory())
                        }
                    }
                    //png
//                    if let image = UIImage(data: data!){
//                        if let data = image.pngData(){
//                            let filename = self.getDocumentDirectory().appendingPathComponent("copy.jpg")
//                            try? data.write(to: filename)
//                            print("Data is writed")
//                            print(self.getDocumentDirectory())
//                        }
//                    }
                }
            }
        }
        // 여기까지 Task라고 함수를 만듦
        task.resume()
        
        
    }
    
    
    //write 위치
    func getDocumentDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }


} //-----


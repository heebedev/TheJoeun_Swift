//
//  DetailViewController.swift
//  DbCrud_01
//
//  Created by 김승희 on 2020/09/03.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblCode: UITextField!
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblDept: UITextField!
    @IBOutlet weak var lblPhone: UITextField!
    
    var receiveCode = ""
    var receiveName = ""
    var receiveDept = ""
    var receivePhone = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblCode.text = receiveCode
        lblName.text = receiveName
        lblDept.text = receiveDept
        lblPhone.text = receivePhone
    }
    
    func receiveItems(_ code: String, _ name: String, _ dept: String, _ phone: String) {
        receiveCode = code
        receiveName = name
        receiveDept = dept
        receivePhone = phone
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnDelete(_ sender: UIButton) {
        let code = lblCode.text
        
        let deleteModel = DeleteModel()
        let result = deleteModel.deleteItems(code: code!)
        
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        } else {
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생되었습니다..", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        let code = lblCode.text
        let name = lblName.text
        let dept = lblDept.text
        let phone = lblPhone.text
        
        let updateModel = UpdateModel()
        let result = updateModel.updateItems(code: code!, name: name!, dept: dept!, phone: phone!)
        
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {Action in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        } else {
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생되었습니다..", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }
        
    }
    
}

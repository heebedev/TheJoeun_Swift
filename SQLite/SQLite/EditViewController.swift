//
//  EditViewController.swift
//  SQLite
//
//  Created by 김승희 on 2020/08/31.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit
import SQLite3

class EditViewController: UIViewController {
    
    var db: OpaquePointer?

    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var receiveId = 0
    var receiveName = ""
    var receiveDept = ""
    var receivePhone = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("StudentsData.sqlite")

        // Do any additional setup after loading the view.
        tfId.text = String(receiveId)
        tfId.isUserInteractionEnabled = false
        tfName.text = receiveName
        tfDept.text = receiveDept
        tfPhone.text = receivePhone
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
    }
    
    
    func receiveItems(_ id: Int, _ name: String, _ dept: String, _ phone: String) {
        receiveId = id
        receiveName = name
        receiveDept = dept
        receivePhone = phone
    }
    
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        
        let updateAlert = UIAlertController(title: "확인", message: "수정하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let updateAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in
            var stmt: OpaquePointer?
            let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
            let queryString = "UPDATE students SET sname = ?, sdept = ?, sphone = ? WHERE sid = ?"
            
            
            let id = self.tfId.text
            let name = self.tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines
            )
            let dept = self.tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines
            )
            let phone = self.tfPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines
            )
            
            
            if sqlite3_prepare(self.db, queryString, -1, &stmt, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("error preparing insert: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 1, name , -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 2, dept , -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding dept: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 3, phone , -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding phone: \(errmsg)")
                return
            }
            if sqlite3_bind_int(stmt, 4, (id as! NSString).intValue) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding phone: \(errmsg)")
                return
            }
            if sqlite3_step(stmt) != SQLITE_DONE{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure insert data: \(errmsg)")
                return
            }
            print("Student saved successfully")
            self.navigationController?.popViewController(animated: true)
            })
        let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        updateAlert.addAction(updateAction)
        updateAlert.addAction(cancelAction)
        present(updateAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        let deleteAlert = UIAlertController(title: "확인", message: "정말 삭제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let deleteAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in
            var stmt: OpaquePointer?
            let queryString = "DELETE FROM students WHERE sid = ?"
            
            let id = self.tfId.text
                    
            if sqlite3_prepare(self.db, queryString, -1, &stmt, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("error preparing insert: \(errmsg)")
                return
            }
            if sqlite3_bind_int(stmt, 1, (id! as NSString).intValue) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding phone: \(errmsg)")
                return
            }
            if sqlite3_step(stmt) != SQLITE_DONE{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure insert data: \(errmsg)")
                return
            }
            print("Student saved successfully")
            self.navigationController?.popViewController(animated: true)
            })
        let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        deleteAlert.addAction(deleteAction)
        deleteAlert.addAction(cancelAction)
        present(deleteAlert, animated: true, completion: nil)
        
    }
    

}

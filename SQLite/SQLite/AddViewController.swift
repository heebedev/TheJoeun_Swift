//
//  AddViewController.swift
//  SQLite
//
//  Created by 김승희 on 2020/08/31.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit
import SQLite3

class AddViewController: UIViewController {
    
    var db: OpaquePointer?

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnInsert(_ sender: UIButton) {
        insertData()
        
        let insertAlert = UIAlertController(title: "결과", message: "정보가 등록되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let insertAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
            })
        
        insertAlert.addAction(insertAction)
        present(insertAlert, animated: true, completion: nil)
        
    }
    
    func insertData() {
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        let queryString = "INSERT INTO students(sname, sdept, sphone) VALUES (?,?,?)"
        
        let name = tfName.text!.trimmingCharacters(in: .whitespacesAndNewlines
        )
        let dept = tfDept.text!.trimmingCharacters(in: .whitespacesAndNewlines
        )
        let phone = tfPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines
        )
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        if sqlite3_bind_text(stmt, 1, name , -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        if sqlite3_bind_text(stmt, 2, dept , -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding dept: \(errmsg)")
            return
        }
        if sqlite3_bind_text(stmt, 3, phone , -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure insert data: \(errmsg)")
            return
        }
        print("Student saved successfully")
        
    }
}

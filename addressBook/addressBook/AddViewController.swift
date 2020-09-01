//
//  AddViewController.swift
//  addressBook
//
//  Created by 김승희 on 2020/09/01.
//  Copyright © 2020 김승희. All rights reserved.
//

import UIKit
import SQLite3

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var pkvRelation: UIPickerView!
    
    var db: OpaquePointer?
    
    let PICKER_VIEW_COLUMN = 1
    let relations = ["가족", "친구", "술친구", "동호회", "직장", "동창", "거래처"]
    var relationSelected:String = "가족"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("AddressData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnAdd(_ sender: UIButton) {
        let insertAlert = UIAlertController(title: "확인", message: "등록하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let insertAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in
            
            var stmt: OpaquePointer?
            let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
            let queryString = "INSERT INTO userinfo(name, phone, email, address, relation) VALUES (?,?,?,?,?)"
            
            let name = self.tfName.text!.trimmingCharacters(in: .whitespacesAndNewlines
            )
            let phone = self.tfPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines
            )
            let email = self.tfEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines
            )
            let address = self.tfAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines
            )
            let relation = self.relationSelected
            
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
            if sqlite3_bind_text(stmt, 2, phone , -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding phone: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 3, email , -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding email: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 4, address , -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding address: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 5, relation , -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(self.db)!)
                print("failure binding relation: \(errmsg)")
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
        
        insertAlert.addAction(insertAction)
        insertAlert.addAction(cancelAction)
        present(insertAlert, animated: true, completion: nil)
    }
    
    @IBAction func btnCancle(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return relations.count
    }
    
    //string of title in each component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return relations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           relationSelected = relations[row]
    }
    
}

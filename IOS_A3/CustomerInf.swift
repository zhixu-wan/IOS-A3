//
//  Restaurant2.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/13.
//

import Foundation

import UIKit

@available(iOS 13.4, *)
class CustomerInf: UIViewController {
    @IBOutlet weak var nameTx: UITextField!
    
    @IBOutlet weak var phoneTx: UITextField!
    
    @IBOutlet weak var peopleNum: UILabel!
    
    
    @IBOutlet weak var peopleNumSlider: UISlider!
    
    
    @IBOutlet weak var bookingTextfield: UITextField!
    let dataPicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatepicker()
    }
    
    @IBAction func Change(_ sender: Any) {
        let value = Int(peopleNumSlider.value)
        peopleNum.text = "\(value)"
    }
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    func createDatepicker(){
        dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.timeZone = .autoupdatingCurrent
        bookingTextfield.inputView = dataPicker
        bookingTextfield.inputAccessoryView = createToolbar()
        
    }
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.bookingTextfield.text = dateFormatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
    
   @IBAction func SaveCus(_ sender: Any) {
     //   let appDelegate = UIApplication.shared.delegate as! AppDelegate
       // appDelegate.storeCustomer(id: 0, nameC: nameTx.text ?? " ", nameR: " ", phone: Int(phoneTx.text)!, num: <#T##Int#>, status: <#T##String#>, date: <#T##Date#>)
    }
    
}

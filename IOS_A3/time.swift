//
//  ViewController.swift
//  DatePickerUI
//
//  Created by ZhengYZe on 2022/5/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookingTextfield: UITextField!
    let dataPicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        createDatepicker()
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
    
    
}


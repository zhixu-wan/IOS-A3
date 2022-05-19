//
//  Restaurant2.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/13.
//

import Foundation

import UIKit


class CustomerInf: UIViewController {
    @IBOutlet weak var nameTx: UITextField!
    @IBOutlet weak var phoneTx: UITextField!
    @IBOutlet weak var peopleNum: UILabel!
    @IBOutlet weak var peopleNumSlider: UISlider!
    @IBOutlet weak var bookingTextfield: UITextField!
    @IBOutlet weak var save: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let dataPicker = UIDatePicker()
    var nameRestaurant = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatepicker()
        save.layer.cornerRadius = 5
        save.layer.masksToBounds = true
    }
    
    @IBAction func Change(_ sender: Any) {
        let valueNum = Int(peopleNumSlider.value)
        peopleNum.text = "\(valueNum)"
    }
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    func createDatepicker(){
        //dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.timeZone = .autoupdatingCurrent
        bookingTextfield.inputView = dataPicker
        bookingTextfield.inputAccessoryView = createToolbar()
        
    }
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        self.bookingTextfield.text = dateFormatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let bookingDate = dataPicker.date
        let today = Date()
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT()
        let now = today.addingTimeInterval(TimeInterval(interval))
        let id = appDelegate.listCustomers().count + 1
        if now < bookingDate {
            if nameTx.text!.count > 0 && phoneTx.text!.count > 0 && peopleNum.text!.count > 0 && bookingTextfield.text!.count > 0 {
                appDelegate.storeCustomer(id: id, nameC: nameTx.text!, nameR: nameRestaurant, phone: phoneTx.text!, num: Int(peopleNum.text!)!, status: "on-going", date: bookingDate)
                let vc = UIAlertController(title: "Success！", message: "you have completed the reservation", preferredStyle: .alert)
                vc.addAction(UIAlertAction(title: "OK", style: .cancel) {
                    _ in
                    let vc = self.storyboard?.instantiateViewController(identifier: "HomePage") as! ViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    vc.navigationItem.setHidesBackButton(true, animated: true)
                })
                self.present(vc, animated: true)
            } else {
                let vc = UIAlertController(title: "Warning!", message: "You should fill all booking information", preferredStyle: .alert)
                vc.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(vc, animated: true)
            }

        } else {
            let vc = UIAlertController(title: "Warning！", message: "You cannot book a time that has passed", preferredStyle: .alert)
            vc.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(vc, animated: true)
        }
    }
    
}

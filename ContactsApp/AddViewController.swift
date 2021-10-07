//
//  AddViewController.swift
//  ContactsApp
//
//  Created by Akniyet Just on 30.09.2021.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var nameSurnameTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var gender: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New contact"
        
        
        nameSurnameTF.returnKeyType = .done
        nameSurnameTF.autocapitalizationType = .words
        nameSurnameTF.autocorrectionType = .no
        nameSurnameTF.becomeFirstResponder()
        nameSurnameTF.delegate = self
        
        numberTF.returnKeyType = .done
        numberTF.autocapitalizationType = .words
        numberTF.autocorrectionType = .no
        numberTF.delegate = self
        
        gender.dataSource = self
        gender.delegate = self
    }
    
    @IBAction func savePressed(_ sender: Any) {
        nameSurnameTF.becomeFirstResponder()
        students.append(Student.init(nameSurnameTF.text!, numberTF.text!, UIImage.init(named: ["male", "female"][gender.selectedRow(inComponent: 0)])!))
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameSurnameTF {
            textField.resignFirstResponder()
            numberTF.becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
        }
        return true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ["male", "female"][row]
    }
}

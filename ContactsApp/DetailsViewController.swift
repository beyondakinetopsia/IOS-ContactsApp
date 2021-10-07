//
//  DetailsViewController.swift
//  ContactsApp
//
//  Created by Akniyet Just on 30.09.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    var student: Student?
    var index: Int?
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = student?.name_surname
        numberLabel.text = student?.gpa
        imageView.image = student?.image
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        students.remove(at: index!)
    
        
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
    @IBAction func callPressed(_ sender: Any) {
        if let phoneCallURL = URL(string: "tel://\(String(describing: student?.gpa!))") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
          }
    }
}

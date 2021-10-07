//
//  ViewController.swift
//  ContactsApp
//
//  Created by Akniyet Just on 30.09.2021.
//

import UIKit

var students = [Student]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    public typealias Index = String.Index
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.studentName?.text = students[indexPath.row].name_surname
        cell?.studentGPA?.text = students[indexPath.row].gpa
        cell?.studentImageView?.image = students[indexPath.row].image
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        configureItems()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableView?.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = (myTableView.indexPathForSelectedRow?.row)! 
        let destination = segue.destination as! DetailsViewController
        destination.student = students[index]
        destination.index = index
        
    }
    
    func configureItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    @objc func addTapped(){
        let addVC = self.storyboard?.instantiateViewController(identifier: "AddViewController") as! AddViewController
        navigationController?.pushViewController(addVC, animated: true)
    }
}


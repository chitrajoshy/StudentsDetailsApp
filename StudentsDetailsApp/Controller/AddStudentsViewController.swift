//
//  AddStudentsViewController.swift
//  StudentsDetailsApp
//
//  Created by Chitra Hari on 23/08/19.
//  Copyright © 2019 Chitra Hari. All rights reserved.
//

import UIKit

class AddStudentsViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addStudent(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddStudent", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddStudent" {
            let obj1 = segue.destination as!
                StudentsListTableViewController
            
            obj1.data1 = "Data recieved"
            
            
            
            print("\(txtName.text!)")
        }
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



//
//  ViewController.swift
//  StudentsDetailsApp
//
//  Created by Chitra Hari on 21/08/19.
//  Copyright © 2019 Chitra Hari. All rights reserved.
//

import UIKit
import SVProgressHUD
class ViewController: UIViewController {
    @IBAction func btnStudentsList(_ sender: UIButton) {
        SVProgressHUD.show()
        performSegue(withIdentifier: "studentsList", sender: self)
        SVProgressHUD.dismiss()
    }
    @IBAction func BtnAdd(_ sender: UIButton) {
    }
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


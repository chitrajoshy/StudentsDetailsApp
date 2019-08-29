//
//  StudentsListTableViewController.swift
//  StudentsDetailsApp
//
//  Created by Chitra Hari on 23/08/19.
//  Copyright © 2019 Chitra Hari. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import SVProgressHUD

class StudentsListTableViewController: UITableViewController {
    var data1 : String = ""
    var studentDatas = [StudentsList]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedCategory = AddedStudent?.self {
        didSet {
            fetchData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
       
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    // mark : table func
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentDatas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
cell.textLabel?.text = studentDatas[indexPath.row].name
//        if studentDatas[indexPath.row].data == true {
//            cell.accessoryType = .checkmark
//        }else {
//            cell.accessoryType = .none
//        }
//
        return cell
    }
    
    //     mark: selection of cell
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "studentDetails", sender: self)
//        studentDatas[indexPath.row].data = !studentDatas[indexPath.row].data
//
        saveData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let studentDetail = segue.destination as! DetailsViewController
//        if let indexPath = tableView.indexPathForSelectedRow{
//            studentDetail.selectedStudent
//        }
//    }

    func saveData() {
        do{
            try context.save()
        }catch {
            print("error saving data\(error)")
        }
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //*
//     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
        context.delete(studentDatas[indexPath.row])
            studentDatas.remove(at: indexPath.row)
            tableView.reloadData()
            saveData()
            
        }
    }
    

    
    func fetchData(with request : NSFetchRequest<StudentsList> = StudentsList.fetchRequest(),predicate: NSPredicate? = nil ) {
        let categoryPredicate = NSPredicate(format: "studentslist.name MATCHES %@", selectedCategory. )
        if let additionPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate,additionPredicate])
            
        } else {
            request.predicate = categoryPredicate
        }
        
        
        do {
            studentDatas = try context.fetch(request)
        } catch {
            print("error fetching data")
        }
        tableView.reloadData()
        
    }
}

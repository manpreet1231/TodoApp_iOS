//
//  ViewController.swift
//  TODO_App
//
//  Created by Tajamal on 15/03/2022.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    var ary = ["asd","sdfsdf","asdfsd","asd","sdfsdf","asdfsd"]
    //Initilization...
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var Detail : [TodoInfo]?
    @IBOutlet weak var txtTittle: UITextField!
    
    @IBOutlet weak var txtDescription: UITextView!
    
    @IBOutlet weak var viewAlert: UIView!
    
    @IBOutlet weak var viewBack: UIView!
    
    
    @IBAction func btnSave(_ sender: Any) {
        print(txtTittle.text)
        print(txtDescription.text)
        
        let newTodo = TodoInfo(context: self.context)
        
        newTodo.tittle = txtTittle.text ?? ""
        newTodo.discription = txtDescription.text ?? ""
        
        do{
            try self.context.save()
        }
        catch{
            print("Eror")
        }
        self.fetchData()
        
        viewAlert.isHidden = true
        
        txtTittle.text = ""
        txtDescription.text = ""
    }
    @IBAction func btnCancel(_ sender: Any) {
        viewAlert.isHidden = true
        
        txtTittle.text = ""
        txtDescription.text = ""
    }
    @IBOutlet weak var tblTodoItemInfo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBack.layer.cornerRadius = 8
        viewBack.layer.borderWidth = 1
        viewBack.layer.borderColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        fetchData()
        // Do any additional setup after loading the view.
    }


    @IBAction func addNewTodoItem(_ sender: Any) {
        viewAlert.isHidden = false
    }
    
    func fetchData(){
        do{
            self.Detail =  try context.fetch(TodoInfo.fetchRequest())
            DispatchQueue.main.async {
                self.tblTodoItemInfo.reloadData()
            }
            
        }
        catch{
            
        }
    }
    
}

extension  ViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Detail?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TodoInfoCell
        
        cell.lblTodoTittle.text = Detail?[indexPath.row].tittle
        cell.lblTodoDetail.text = Detail?[indexPath.row].discription
        return cell
      
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete"){ (action,view, completionHandler) in
            
            let todoToRemove = self.Detail?[indexPath.row]
            self.context.delete(todoToRemove!)
            
            do{
                try self.context.save()
            }
            catch{
                print("Eror")
            }
            self.fetchData()
    }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}

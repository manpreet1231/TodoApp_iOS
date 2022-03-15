//
//  ViewController.swift
//  TODO_App
//
//  Created by Tajamal on 15/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var ary = ["asd","sdfsdf","asdfsd","asd","sdfsdf","asdfsd"]
    //Initilization...
    
    @IBOutlet weak var txtTittle: UITextField!
    
    @IBOutlet weak var txtDescription: UITextView!
    
    @IBOutlet weak var viewAlert: UIView!
    
    @IBAction func btnSave(_ sender: Any) {
        print(txtTittle.text)
        print(txtDescription.text)
        viewAlert.isHidden = true
    }
    @IBAction func btnCancel(_ sender: Any) {
        viewAlert.isHidden = true
    }
    @IBOutlet weak var tblTodoItemInfo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAlert.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }


    @IBAction func addNewTodoItem(_ sender: Any) {
        viewAlert.isHidden = false
    }
    
    
    
}

extension  ViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TodoInfoCell
        
        cell.lblTodoTittle.text = ary[indexPath.row]
        cell.lblTodoDetail.text = "asdfkasjdfksajdkfjaskdfj;asdjrief;asdufiewjfkdffa;kdfjapierfjkdfasjdfiefjskdfmxc vkxzjfdpapieruflkasdf;kldjfakdjfaksdjfksdjfskdjfskejfwiefjsdlkcvx.cvmx;dlkfsdjfaierskddnv"
        return cell
      
    }
    
    
}

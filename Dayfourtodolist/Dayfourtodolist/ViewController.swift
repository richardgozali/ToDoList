//
//  ViewController.swift
//  Dayfourtodolist
//
//  Created by Richard G on 16/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var userDefaults = UserDefaults.standard
     var listToDo = ToDoList()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listToDo.listtodo.count;
    }
    
    @IBAction func movePage(_ sender: Any) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(listToDo), forKey:"TODO")
        let BlueVc =  UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "SecondViewController")
        self.navigationController?.pushViewController(BlueVc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell") as! TableViewCell
        cell.textLabel?.text = listToDo.listtodo[indexPath.row].name;
        return cell
    }
    

    @IBOutlet weak var toDoListTable: UITableView!
    override func viewDidLoad() {
        toDoListTable.delegate = self
        toDoListTable.dataSource = self
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        if let data = UserDefaults.standard.value(forKey:"TODO") as? Data {
            let songs2 = try? PropertyListDecoder().decode(ToDoList.self, from: data)
            listToDo = songs2 ?? ToDoList()
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "To Do List"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if(editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
              self.listToDo.listtodo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }



}


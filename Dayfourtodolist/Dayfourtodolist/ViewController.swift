//
//  ViewController.swift
//  Dayfourtodolist
//
//  Created by Richard G on 16/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var userDefaults = UserDefaults.standard
    var task = ToDoListTask()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.GetDataCount();
    }
    
    @IBAction func movePage(_ sender: Any) {
        let BlueVc =  UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "SecondViewController")
        self.navigationController?.pushViewController(BlueVc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell") as! TableViewCell
        cell.textLabel?.text = task.GetName(index: indexPath.row);
        return cell
    }
    

    @IBOutlet weak var toDoListTable: UITableView!
    override func viewDidLoad() {
        toDoListTable.delegate = self
        toDoListTable.dataSource = self
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    
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
              task.RemoveData(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }



}


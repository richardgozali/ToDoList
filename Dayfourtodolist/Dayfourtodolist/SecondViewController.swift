//
//  SecondViewController.swift
//  Dayfourtodolist
//
//  Created by Richard G on 16/06/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var taskNotes: UITextView!
    @IBOutlet weak var hasilLabel: UILabel!
    @IBOutlet weak var subTitleTextField: UITextField!
    var task = ToDoListTask()
     override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
         taskNotes.layer.borderWidth = 0.5
         taskNotes.layer.borderColor = borderColor.cgColor
         taskNotes.layer.cornerRadius = 5.0
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func Submit(_ sender: Any) {
        if( nameTextField.text != "" || subTitleTextField.text != ""){
            let nama = nameTextField?.text ?? ""
            let subtitle = subTitleTextField?.text ?? ""
            let description = taskNotes.text ?? ""
            
            task.InsertData(name: nama, description: description, subtitle: subtitle)
            task.SendData()
            let BlueVc =  UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ViewController")
            self.navigationController?.pushViewController(BlueVc, animated: true)
            
        }
        else{
            let alert = UIAlertController(title: "Warning", message: "Please Insert Data", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
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

}

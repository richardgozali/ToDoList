//
//  ToDoListTask.swift
//  Dayfourtodolist
//
//  Created by Richard G on 17/06/22.
//

import Foundation
import UIKit
protocol Event{
    
}
class ToDoListTask{
    private var listToDo = ToDoList()
    init() {
        self.LoadData()
    }
    public func LoadData(){
        if let data = UserDefaults.standard.value(forKey:"TODO") as? Data {
            let songs2 = try? PropertyListDecoder().decode(ToDoList.self, from: data)
            listToDo = songs2 ?? ToDoList()
        }
    }
    
    public func GetDataCount()->Int{
        return self.listToDo.listtodo.count
    }
    
    public func SendData(){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(listToDo), forKey:"TODO")
        
    }
    public func InsertData(name:String , description:String , subtitle:String){
        let newToDo = ToDo(
            name: name,
            description: description,
            subtitle: subtitle
        )
        listToDo.listtodo.append(newToDo)
    }
    public func GetName(index : Int)->String{
        return self.listToDo.listtodo[index].name
    }
    
    public func RemoveData(index : Int){
        listToDo.listtodo.remove(at: index)
        self.SendData()
    }
}

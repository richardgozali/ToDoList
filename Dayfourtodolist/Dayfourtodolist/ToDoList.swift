//
//  ToDoList.swift
//  Dayfourtodolist
//
//  Created by Richard G on 16/06/22.
//

import Foundation

struct ToDoList : Codable{
    var listtodo : [ToDo] = []
}
struct ToDo : Codable{
    var name : String = ""
    var description : String = ""
    var subtitle : String = ""
}

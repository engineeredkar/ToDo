//
//  ToDo.swift
//  ToDo
//
//  Created by Edgar Karapetyan on 09.12.21.
//

import Foundation

struct ToDo: Equatable {
    let id = UUID().uuidString
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func ==( lhs: ToDo, rhs: ToDo) -> Bool {
        lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSimpleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return[todo1, todo2, todo3]
        
    }
}

//
//  ToDo.swift
//  ToDo
//
//  Created by Edgar Karapetyan on 09.12.21.
//

import Foundation

struct ToDo: Equatable, Codable {
    var id = UUID().uuidString
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                                in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    static func ==( lhs: ToDo, rhs: ToDo) -> Bool {
        lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedTodos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedTodos)
    }
    
    static func saveToDos(_ todos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadSimpleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo1", isComplete: false, dueDate: Date(), notes: "notes1")
        return [todo1]
    }
}

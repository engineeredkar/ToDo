//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by Edgar Karapetyan on 09.12.21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var todos = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedToDos = ToDo.loadToDos(){
            todos = savedToDos
        } else {
            todos = ToDo.loadSimpleToDos()
        }
        navigationItem.leftBarButtonItem = editButtonItem
    }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath)
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func unwindToToDoList( segue: UIStoryboardSegue) {
        guard
            segue.identifier == "saveUnwind",
            let sourceViewController = segue.source as? ToDoDetailTableViewController
        else { return }
        
        if let todo = sourceViewController.toDo {
            let newIndexPath = IndexPath(row: todos.count, section: 0)
            todos.append(todo)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}

//
//  ViewController.swift
//  SimpleTodoAppV2
//
//  Created by Atsushi KONISHI on 2018/08/06.
//  Copyright © 2018年 小西篤志. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    var todoModel = TodoModel()
    var todos: [Todo] = []
    deinit {
        print("\(self) was deinited")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do anvardditional setup after loading thevarew, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setup() {
        todoTableView.delegate = self
        todoTableView.dataSource = self
        updateUI()
    }
    
    @IBAction func toCreateView(_ sender: Any) {
        let createVC = self.storyboard?.instantiateViewController(withIdentifier: "edit") as! EditViewController
        createVC.style = .create
        createVC.todoModel = self.todoModel
        present(createVC, animated: true, completion: nil)
    }
    
    func updateUI() {
        navigationController?.isToolbarHidden = true
        todoModel.read(completion: { tds in
            self.todos = tds
        })
        todoTableView.reloadData()
    }
}

extension IndexViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        cell.setup(title: todos[indexPath.item].title, date: todos[indexPath.item].date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        detailVC.todo = todos[indexPath.item]
        detailVC.todoModel = self.todoModel
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


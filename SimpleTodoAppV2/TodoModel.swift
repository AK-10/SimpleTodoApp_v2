//
//  File.swift
//  SimpleTodoAppV2
//
//  Created by Atsushi KONISHI on 2018/08/07.
//  Copyright © 2018年 小西篤志. All rights reserved.
//

import Foundation

class TodoModel {
    private var todos: [Todo] = []
    
//    それぞれの引数にあるcompletionはdbの操作を行った後にControllerが行う処理を(ViewControllerにて)書く
    
    func read(completion: @escaping ([Todo]) -> Void) {
        completion(todos)
    }
    
    func create(t: String, d: Date, m: String, completion:  @escaping (Todo) -> Void) {
        print("called create")
        let id = (todos.last?.id ?? 0) + 1
        let todo = Todo(id, t, d, m)
        print(todo)
        todos.append(todo)
        completion(todo)
    }
    
    func update(id: Int, t: String, d: Date, m: String, completion: @escaping (Todo?) -> Void){
        // guard var todo = todos.first(where: {$0.id == id}) else { throw NSError(domain: "this todo not found", code: -1, userInfo: nil) }
        print("called update")
        guard let todo = todos.first(where: {$0.id == id}) else { completion(nil); return }
        todo.title = t
        todo.date = d
        todo.memo  = m
        completion(todo)
    }
    
    func delete(id: Int, completion: @escaping (Todo) -> Void) {
        print("called delete")
        guard let index = todos.index(where: {$0.id == id}) else { return }
        completion(todos.remove(at: index))
    }
}

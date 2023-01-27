//
//  TodoItem.swift
//  ToDoExample
//
//  Created by Nedim Basic on 27. 1. 2023..
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    var completed: Bool = false
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

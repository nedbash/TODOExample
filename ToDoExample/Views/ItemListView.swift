//
//  ItemListView.swift
//  ToDoExample
//
//  Created by Nedim Basic on 27. 1. 2023..
//

import SwiftUI

struct ItemListView: View {
    
    @State var newItemDialogShown = false
    @State var newItemTitle = ""
    @AppStorage("todoItems") var items: [TodoItem] = []
    
    var body: some View {
        NavigationView {
            List($items) { $item in
                NavigationLink {
                    ItemDetailView(item: $item)
                } label: {
                    Text(item.title)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        newItemDialogShown = true
                    } label: {
                        Label("", systemImage: "plus")
                            .foregroundColor(.blue)
                    }
                }
            }
            .alert("Add item", isPresented: $newItemDialogShown, actions: {
                TextField("Title", text: $newItemTitle)
                Button("Add") {
                    addItem()
                }
            })
            .navigationTitle("TODOs")
        }
    }
    
    func addItem() {
        let newItem = TodoItem(title: newItemTitle)
        items.append(newItem)
        newItemTitle = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    
    @State static var dummyItems = [
        TodoItem(title: "first"),
        TodoItem(title: "second")
    ]
    
    static var previews: some View {
        ItemListView(items: dummyItems)
    }
}

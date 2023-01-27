//
//  ItemDetailView.swift
//  ToDoExample
//
//  Created by Nedim Basic on 27. 1. 2023..
//

import SwiftUI

struct ItemDetailView: View {
    
    @Binding var item: TodoItem
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(item.title)
                .font(.title2)

            Toggle(isOn: $item.completed) {
                Text("Completed ")
            }

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemDetailView(item: .constant(TodoItem(title: "default")))
    }
}

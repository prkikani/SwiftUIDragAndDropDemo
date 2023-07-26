//
//  ContentView.swift
//  DragAndDropStarter
//
//  Created by Pradip Kikani on 7/14/23.
//

import SwiftUI

struct ContentView: View {

    @State private var toDoTasks: [String] = ["Swift Programming", "Obj-C", "Swift UI"]
    @State private var inProgressTasks: [String] = []
    @State private var doneTasks: [String] = []

    var body: some View {
        HStack(spacing: 12) {
            TodoView(title: "To Do", tasks: toDoTasks).dropDestination(for: String.self, action: { items, location in
                for item in items {
                    toDoTasks.removeAll(where: {$0 == item})
                    inProgressTasks.removeAll(where: {$0 == item})
                    doneTasks.removeAll(where: {$0 == item})
                }
                
                toDoTasks += items
                return true
            })
            TodoView(title: "In Progress", tasks: inProgressTasks).dropDestination(for: String.self, action: { items, location in
                for item in items {
                    toDoTasks.removeAll(where: {$0 == item})
                    inProgressTasks.removeAll(where: {$0 == item})
                    doneTasks.removeAll(where: {$0 == item})
                }
                
                inProgressTasks += items
                return true
            })
            TodoView(title: "Done", tasks: doneTasks).dropDestination(for: String.self, action: { items, location in
                for item in items {
                    toDoTasks.removeAll(where: {$0 == item})
                    inProgressTasks.removeAll(where: {$0 == item})
                    doneTasks.removeAll(where: {$0 == item})
                }
                
                doneTasks += items
                return true
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

struct TodoView: View {

    let title: String
    let tasks: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(.secondarySystemFill))

                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(task)
                    }

                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}

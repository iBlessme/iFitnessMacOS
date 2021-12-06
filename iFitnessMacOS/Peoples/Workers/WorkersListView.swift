//
//  WorkersListView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import SwiftUI

struct WorkersListView: View {
    @State var workerModel = [Worker]()
    @State var showAdd = false
    @State var showEdit = false
    @State var showDelete = false
    var body: some View {
        List(workerModel, id: \.self){ workers in
            HStack{
                Text("id: \(workers.id)")
                Divider()
                Text("\(workers.user_club.name_user) \(workers.user_club.surname) \(workers.user_club.thirdname)")
                Divider()
                Text("\(workers.salary)р")
                Divider()
                Text("\(workers.position_work.name_position)")
            }
            Divider()
        }
        .onAppear{
            WorkerModel().fetch{ items in
                self.workerModel = items
            }
        }
        .toolbar{
            Button("✅ Добавить"){
                showAdd.toggle()
            }
            Button("✏ Изменить"){
                showEdit.toggle()
            }
            Button("✖️ Удалить"){
                showDelete.toggle()
            }
        }
        .sheet(isPresented: $showAdd){
            WorkerAdd(isVisible: $showAdd)
        }
    }
}

struct WorkersListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkersListView()
    }
}

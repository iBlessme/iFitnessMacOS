//
//  HallView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct HallView: View {
    @State var hallModel = [Hall]()
    @State var showAdd = false
    @State var showEdit = false
    @State var showDelete = false
    var body: some View {
        List(hallModel, id: \.self) {halls in
            HStack{
                Text("id: \(halls.id)")
                    .frame(width: 40)
                Divider()
                Text("Наименование: \(halls.name_hall)")
                    .frame(width: 200)
                Divider()
                Text("Вместимость: \(halls.capacity)")
                    .frame(width: 150)
                Divider()
                Text("Тренировка: \(halls.types_of_traning.name_traning)")
            }
            Divider()
        }
        .onAppear{
            HallModel().fetch{ items in
                self.hallModel = items
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
            HallAdd(isVisible: $showAdd)
        }
        .sheet(isPresented: $showEdit){
            HallEdit(isVisible: $showEdit)
        }
        .sheet(isPresented: $showDelete){
            HallDelete(isVisible: $showDelete)
        }
    }
}

struct HallView_Previews: PreviewProvider {
    static var previews: some View {
        HallView()
    }
}

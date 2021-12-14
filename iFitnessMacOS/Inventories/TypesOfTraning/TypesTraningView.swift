//
//  TypesTraningView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct TypesTraningView: View {
    @State var traningModel = [TypesOfTraning]()
    @State var showAdd = false
    @State var showEdit = false
    @State var showDelete = false
    var body: some View {
        List(traningModel, id: \.self) {tranings in
            HStack{
                Text("id: \(tranings.id)")
                    .frame(width: 40)
                Divider()
                Text("Наименование: \(tranings.name_traning)")
            }
            Divider()
        }
        .onAppear{
            TypesOfTraningModel().fetch{ item in
                self.traningModel = item
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
            TypesOfTraningAdd(isVisible: $showAdd)
        }
        .sheet(isPresented: $showEdit){
            TypesOfTraningEdit(isVisible: $showEdit)
        }
        .sheet(isPresented: $showDelete){
            TypesOfTraningDelete(isVisible: $showDelete)
        }
    }
}

struct TypesTraningView_Previews: PreviewProvider {
    static var previews: some View {
        TypesTraningView()
    }
}

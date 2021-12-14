//
//  TypesInventoryView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct TypesInventoryView: View {
    @State var typesOfInventoryModel = [TypesOfInventory]()
    @State var showAdd = false
    @State var showEdit = false
    @State var showDelete = false
    var body: some View {
        List(typesOfInventoryModel, id: \.self){ types in
            HStack {
                Text("id: \(types.id)")
                    .frame(width: 40)
                Divider()
                Text("Наименование: \(types.name_inventory)")
            }
            Divider()
           
            
        }
        .onAppear{
            TypesOfInventoryModel().fetch{ item in
                self.typesOfInventoryModel = item
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
            TypesInventoryAdd(isVisible: $showAdd)
        }
        .sheet(isPresented: $showEdit){
            TypesInventoryEdit(isVisible: $showEdit)
        }
        .sheet(isPresented: $showDelete){
            TypesInventoryDelete(isVisible: $showDelete)
        }
    }
}

struct TypesInventoryView_Previews: PreviewProvider {
    static var previews: some View {
        TypesInventoryView()
    }
}

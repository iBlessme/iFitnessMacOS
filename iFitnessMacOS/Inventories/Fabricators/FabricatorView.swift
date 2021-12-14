//
//  FabricatorView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct FabricatorView: View {
    @State var fabricatorModel = [Fabricator]()
    @State var showAdd = false
    @State var showEdit = false
    @State var showDelete = false
    var body: some View {
        List(fabricatorModel, id: \.self){ fabricators in
            HStack{
                Text("id: \(fabricators.id)")
                    .frame(width: 40)
                Divider()
                Text("Название: \(fabricators.name_fabricator)")
                    .frame(width: 150)
                Divider()
                Text("Страна: \(fabricators.country)")
            }
            Divider()
        }
        .onAppear{
            FabricatorModel().fetch{ items in
                self.fabricatorModel = items
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
            FabricatorAdd(isVisible: $showAdd)
        }
        .sheet(isPresented: $showEdit){
            FabricatorEdit(isVisible: $showEdit)
        }
        .sheet(isPresented: $showDelete){
            FabricatorDelete(isVisible: $showDelete)
        }
    }
}

struct FabricatorView_Previews: PreviewProvider {
    static var previews: some View {
        FabricatorView()
    }
}

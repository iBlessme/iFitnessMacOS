//
//  PositionView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct PositionView: View {
    @State var positionModel = [PositionWork]()
    @State private var showAdd = false
    @State private var showAEdit = false
    @State private var showDelete = false
    var body: some View {
        List(positionModel, id:\.self) {positions in
            HStack{
                Text("id: \(positions.id)")
                    .frame(width: 40)
                Divider()
                Text("Должность: \(positions.name_position)")
            }
            Divider()
        }
        .onAppear{
            PositionWorkModel().fetch{ items in
                self.positionModel = items
            }
        }
        .toolbar{
            Button(action: {showAdd.toggle()}){
                Text("✅ Добавить")
            }
            Button(action: {showAEdit.toggle()}){
                Text("✏ Изменить")
            }
            Button(action: {showDelete.toggle()}){
                Text("✖️ Удалить")
            }
        }
        .sheet(isPresented: $showAdd){
            PositionWorkAdd(isVisible: self.$showAdd)
        }
        .sheet(isPresented: $showAEdit){
            PositionWorkEdit(isVisible: self.$showAEdit)
        }
        .sheet(isPresented: $showDelete){
            PositionWorkDelete(isVisible: self.$showDelete)
        }
    }
}

struct PositionView_Previews: PreviewProvider {
    static var previews: some View {
        PositionView()
    }
}

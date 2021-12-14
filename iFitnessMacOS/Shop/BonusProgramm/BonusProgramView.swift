//
//  BonusProgramView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct BonusProgramView: View {
    @State var bonusProgramModel = [BonusProgram]()
    @State private var showAdd = false
    @State private var showAEdit = false
    @State private var showDelete = false
    var body: some View {
        List(bonusProgramModel, id: \.self) {programms in
            HStack{
                Text("id: \(programms.id)")
                    .frame(width: 40)
                Divider()
                Text("Наименование: \(programms.name_programm)")
                    .frame(width: 220)
                Divider()
                Text("Стоимость: \(programms.cost)")
            }
            Divider()
        }
        .onAppear{
            BonusProgramModel().fetch{items in
                self.bonusProgramModel = items
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
            BonusProgramAdd(isVisible: self.$showAdd)
        }
        .sheet(isPresented: $showAEdit){
            BonusProgrammEdit(isVisible: $showAEdit)
        }
        .sheet(isPresented: $showDelete){
            BonusProgramDelete(isVisible: $showDelete)
        }
        
    }
}

struct BonusProgramView_Previews: PreviewProvider {
    static var previews: some View {
        BonusProgramView()
    }
}

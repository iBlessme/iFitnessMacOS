//
//  AbonementView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct AbonementView: View {
    @State var abonementModel = [Abonements]()
    @State private var showAdd = false
    @State private var showAEdit = false
    @State private var showDelete = false
    var body: some View {
        List(abonementModel, id: \.self){abonemens in
            HStack{
                Text("id: \(abonemens.id)")
                Divider()
                Text("Стоимость: \(abonemens.cost_abonement)")
                Divider()
                Text("Начало: \(abonemens.date_start) - Конец: \(abonemens.date_finish) ")
                Divider()
                Text("Бонусная программа: \(abonemens.bonus.name_programm)")
            }
        }
        .onAppear{
            AbonementModel().fetch{ item in
                self.abonementModel = item
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
            AbonementAdd(isVisible: self.$showAdd)
        }
        .sheet(isPresented: $showAEdit){
            AbonementEdit()
        }
        .sheet(isPresented: $showDelete){
            AbonementDelete()
        }
    }
}

struct AbonementView_Previews: PreviewProvider {
    static var previews: some View {
        AbonementView()
    }
}

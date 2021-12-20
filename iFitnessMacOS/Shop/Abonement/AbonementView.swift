//
//  AbonementView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct AbonementView: View {
//    @State var isSucces = 
    @State var abonementModel = [Abonements]()
    @State private var showAdd = false
    @State private var showAEdit = false
    @State private var showDelete = false
    var body: some View {
        List(abonementModel, id: \.self){abonemens in
            HStack{
                Text("id: \(abonemens.id)")
                    .frame(width: 40)
                Divider()
                Text("Стоимость: \(abonemens.cost_abonement)")
                    .frame(width: 100)
                Divider()
                Text("Начало: \(abonemens.date_start) - Конец: \(abonemens.date_finish) ")
                    .frame(width: 230)
                Divider()
                Text("Бонусная программа: \(abonemens.bonus.name_programm)")
                Group{
                    Button("🗑"){
                        guard let url = URL(string: "http://127.0.0.1:8000/api/abonement/\(abonemens.id)") else {
                            print("Не удалось подключиться к API")
                            return
                        }
                        var request = URLRequest(url: url)
                        request.httpMethod = "DELETE"
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        URLSession.shared.dataTask(with: request) {data, response, error in
                            do{
                               
                                let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                                print("Success: \(response)")
                                
                            }catch{
                                print(error)
                            }
                        }
                        .resume()
                    }
                    Button("✏️"){
                        
                    }
                }
            }
            Divider()
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
//            Button(action: {showAEdit.toggle()}){
//                Text("✏ Изменить")
//            }
//            Button(action: {showDelete.toggle()}){
//                Text("✖️ Удалить")
//            }
        }
        .sheet(isPresented: $showAdd){
            AbonementAdd(isVisible: self.$showAdd)
        }
        .sheet(isPresented: $showAEdit){
            AbonementEdit(isVisible: self.$showAEdit)
        }
        .sheet(isPresented: $showDelete){
            AbonementDelete(isVisible: $showDelete)
        }
    }
}

struct AbonementView_Previews: PreviewProvider {
    static var previews: some View {
        AbonementView()
    }
}

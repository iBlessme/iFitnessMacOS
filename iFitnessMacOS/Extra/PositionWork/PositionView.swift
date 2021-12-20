//
//  PositionView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct PositionView: View {
    @State var positionModel = [PositionWork]()
    @State var isSuccess = false
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
                
                    Button("🗑"){
                        guard let url = URL(string: "http://127.0.0.1:8000/api/positionWork/\(positions.id)") else {
                            print("Не удалось подключиться к API")
                            return
                        }
                        var request = URLRequest(url: url)
                        request.httpMethod = "DELETE"
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        URLSession.shared.dataTask(with: request) {data, response, error in
                            do{
                                self.isSuccess = true
                                let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                                print("Success: \(response)")
                                
                            }catch{
                                print(error)
                            }
                        }
                        .resume()
                    }
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

        }
        .sheet(isPresented: $showAdd){
            PositionWorkAdd(isVisible: self.$showAdd)
        }
        .sheet(isPresented: $showAEdit){
            PositionWorkEdit(isVisible: self.$showAEdit)
        }
    }
}

struct PositionView_Previews: PreviewProvider {
    static var previews: some View {
        PositionView()
    }
}

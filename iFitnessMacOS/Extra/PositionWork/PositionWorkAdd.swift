//
//  PositionWorkAdd.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 07.12.2021.
//

import SwiftUI

func positionAdd(){
    
}

struct PositionWorkAdd: View {
    @State var nilFields = false
    @State var connectApi = false
    @State var errorData = false
    @Binding var isVisible: Bool
    @State var positionName = String()
    var body: some View {
        VStack{
            TextField("Название должности", text: $positionName)
            HStack {
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    if positionName != ""{
                        guard let url = URL(string: "http://127.0.0.1:8000/api/positionWork") else {
                              connectApi = true
                              return
                          }
                          var request = URLRequest(url: url)
                          request.httpMethod = "POST"
                          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                          let body: [String: AnyHashable] = [
                            "name_position" : positionName

                          ]
                        print(body)
                          request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

                          let task = URLSession.shared.dataTask(with: request) {data, _, error in
                              guard let data = data, error == nil else{
                                  return
                              }
                              do{
                                  let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                                  print("Success: \(response)")
                                  self.isVisible = false
                              }catch{
                                  errorData = true
                                  print(error)
                              }
                          }
                          task.resume()
                    }
                    else{
                        nilFields = true
                    }
                    
                }
                .background(Color.accentColor)
                .alert(isPresented: $nilFields){
                    Alert(
                    title: Text("Ошибка"), message: Text("Не верно введены данные")
                    )
                }
                .alert(isPresented: $connectApi){
                    Alert(
                    title: Text("Ошибка"), message: Text("Не удалось подключится к api")
                    )
                }
                .alert(isPresented: $errorData){
                    Alert(
                    title: Text("Ошибка"), message: Text("Не удалось обработать запрос")
                    )
                }
            }
        }
        .padding()
    }
}

struct PositionWorkAdd_Previews: PreviewProvider {
    static var previews: some View {
        PositionWorkAdd(isVisible: .constant(true))
    }
}

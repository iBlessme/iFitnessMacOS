//
//  TypesOfTraningAdd.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 08.12.2021.
//

import SwiftUI

struct TypesOfTraningAdd: View {
    @Binding var isVisible: Bool
    @State var nameTraning = String()
    var body: some View {
        VStack{
            TextField("Наименование", text: $nameTraning)
            HStack{
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    guard let url = URL(string: "http://127.0.0.1:8000/api/typesOfTraning") else {
                          print("Не удалось подключится к API")
                          return
                      }
                      var request = URLRequest(url: url)
                      request.httpMethod = "POST"
                      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      let body: [String: AnyHashable] = [
                        "name_traning" : nameTraning
                      
                  
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
                              print(error)
                          }
                      }
                      task.resume()
                }
                .background(Color.accentColor)
            }
        }
        .padding()
    }
}

struct TypesOfTraningAdd_Previews: PreviewProvider {
    static var previews: some View {
        TypesOfTraningAdd(isVisible: .constant(true))
    }
}

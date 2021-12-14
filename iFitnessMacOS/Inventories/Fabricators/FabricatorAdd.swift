//
//  FabricatorAdd.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 08.12.2021.
//

import SwiftUI

struct FabricatorAdd: View {
    @Binding var isVisible: Bool
    @State var name = String()
    @State var country = String()
    var body: some View {
        VStack{
            TextField("Производитель", text: $name)
            TextField("Страна", text: $country)
            HStack{
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    guard let url = URL(string: "http://127.0.0.1:8000/api/fabricator") else {
                          print("Не удалось подключится к API")
                          return
                      }
                      var request = URLRequest(url: url)
                      request.httpMethod = "POST"
                      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      let body: [String: AnyHashable] = [
                        "name_fabricator" : name,
                        "country" : country
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

struct FabricatorAdd_Previews: PreviewProvider {
    static var previews: some View {
        FabricatorAdd(isVisible: .constant(true))
    }
}

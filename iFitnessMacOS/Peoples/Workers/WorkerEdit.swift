//
//  WorkerEdit.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct WorkerEdit: View {
    @Binding var isVisible: Bool
    @State var id = String()
    @State var salary = String()
    @State var user_id = String()
    @State var positionWork = String()
    
    var body: some View {
        VStack{
            TextField("id", text: $id)
            TextField("Укажите зарплату", text: $salary)
            TextField("Укажите номер пользователя", text: $user_id)
            TextField("Укажите код должности", text: $positionWork)
            HStack {
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    guard let url = URL(string: "http://127.0.0.1:8000/api/workers/\(id)") else {
                          print("Не удалось подключится к API")
                          return
                      }
                      var request = URLRequest(url: url)
                      request.httpMethod = "PUT"
                      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      let body: [String: AnyHashable] = [
                        "salary" : salary,
                        "position_works_id" : positionWork,
                        "user_clubs_id" : user_id
                  
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

struct WorkerEdit_Previews: PreviewProvider {
    static var previews: some View {
        WorkerEdit(isVisible: .constant(true))
    }
}

//
//  PositionWorkEdit.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 07.12.2021.
//

import SwiftUI

struct PositionWorkEdit: View {
    @Binding var isVisible: Bool
    @State var id = String()
    @State var namePosition = String()
    var body: some View {
        VStack{
            TextField("Укажите ID", text: $id)
            TextField("Укажите должность", text: $namePosition)
            HStack{
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    guard let url = URL(string: "http://127.0.0.1:8000/api/positionWork/\(id)") else {
                          print("error1")
                          return
                      }
                      var request = URLRequest(url: url)
                      request.httpMethod = "PUT"
                      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      let body: [String: AnyHashable] = [
                        "name_position" : namePosition
                  
                      ]
                    print(body)
                      request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
                  
                      let task = URLSession.shared.dataTask(with: request) {data, response, error in
                          guard let data = data, error == nil else{
                              return
                          }
                          do{
                              let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                              print("Success: \(response)")
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

struct PositionWorkEdit_Previews: PreviewProvider {
    static var previews: some View {
        PositionWorkEdit(isVisible: .constant(true))
    }
}

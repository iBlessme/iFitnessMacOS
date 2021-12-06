//
//  BonusProgramAd.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct BonusProgramAdd: View {
    @Binding var isVisible: Bool
    @State var cost = String()
    @State var nameProgramm = String()
    
    var body: some View {
        VStack{
            TextField("Название программы", text: $nameProgramm)
            TextField("Стоимость", text: $cost)
            HStack {
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    guard let url = URL(string: "http://127.0.0.1:8000/api/bonus_programm") else {
                          print("error1")
                          return
                      }
                      var request = URLRequest(url: url)
                      request.httpMethod = "POST"
                      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      let body: [String: AnyHashable] = [
                        "name_programm" : nameProgramm,
                        "cost" : cost
                  
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

struct BonusProgramAd_Previews: PreviewProvider {
    static var previews: some View {
        BonusProgramAdd(isVisible: .constant(true))
    }
}

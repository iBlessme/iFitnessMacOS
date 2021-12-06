//
//  ClientAdd.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import SwiftUI

struct ClientAdd: View {
    @Binding var isVisible: Bool
    @State var clients = [Client]()
    @State var userClub = [UserClubs]()
    @State var abonementsModel = [Abonements] ()
    @State var pickerUser = ""
    @State var pickerAbonement = ""
    var body: some View {
        VStack{
            TextField("Введите номер пользователя", text: $pickerUser)
            TextField("Введите номер абонемента", text: $pickerAbonement)
            HStack {
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    
                    guard let url = URL(string: "http://127.0.0.1:8000/api/client") else {
                          print("error1")
                          return
                      }
                      var request = URLRequest(url: url)
                      request.httpMethod = "POST"
                      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      let body: [String: AnyHashable] = [
                        "abonements_id" : pickerAbonement,
                        "user_clubs_id" : pickerUser
                  
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
        .onAppear{
            ClientModel().fetch{items in
                self.clients = items
            }
            UserClubModel().fetch{ item in
                self.userClub = item
            }
            AbonementModel().fetch{ item in
                self.abonementsModel = item
            }
        }
        .frame(width: 500, height: 100)
        
        .padding()
    }
}

struct ClientAdd_Previews: PreviewProvider {
    static var previews: some View {
        ClientAdd(isVisible: .constant(true))
    }
}

//
//  UserClubAdd.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import SwiftUI
import Combine

struct UserClubAdd: View {
    @Binding var isVisible: Bool
    @State var user_name = String()
    @State var surname = String()
    @State var therdname = String()
    @State var passport_number = String()
    @State var passport_serial = String()
    @State var snils = String()
    @State var phone_number = String()
    @State var login = String()
    @State var password = String()
    @State var birth_day = Date()
    @State private var showBack = false
    
    
    var body: some View {
        VStack{
            HStack{
                TextField("Имя: ", text: $user_name)
                TextField("Фамилия: ", text: $surname)
                TextField("Отчество: ", text: $therdname)
            }
            HStack{
                TextField("Номер паспорта: ", text: $passport_number)
                TextField("Серия паспорта: ", text: $passport_serial)
                TextField("Снилс: ", text: $snils)
            }
            TextField("Номер телефона: ", text: $phone_number)
            TextField("Логин: ", text: $login)
            TextField("Пароль: ", text: $password)
            DatePicker("", selection: $birth_day, displayedComponents: .date)
            HStack {
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button(action: {
                        let df = DateFormatter()
                       df.dateFormat = "yyyy-MM-dd"
                       let now = df.string(from: birth_day)
                       
                       guard let url = URL(string: "http://127.0.0.1:8000/api/userClub") else {
                             print("error1")
                             return
                         }
                         var request = URLRequest(url: url)
                         request.httpMethod = "POST"
                         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                         let body: [String: AnyHashable] = [
                             "name_user" : user_name,
                             "surname" : surname,
                             "thirdname" : therdname,
                             "passport_number" : passport_number,
                             "passport_serial" : passport_serial,
                             "snils" : snils,
                             "phone_number" : phone_number,
                             "login" : login,
                             "password" : password,
                             "birth_day" : now
                     
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
                    
                   }){
                    Text("Добавить")
               }
                   .background(Color.accentColor)
            }
            }
        
        .padding()
        
    }
}


struct UserClubAdd_Previews: PreviewProvider {
    static var previews: some View {
        UserClubAdd(isVisible: .constant(true))
    }
}

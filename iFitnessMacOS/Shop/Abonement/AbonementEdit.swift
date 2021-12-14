//
//  AbonementEdit.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct AbonementEdit: View {
    @Binding var isVisible : Bool
    @State var id = String()
    @State var nameAbonement = String()
    @State var costAbonement = String()
    @State var dateSart = Date()
    @State var dateFinish = Date()
    @State var bonus = String()
    var body: some View {
        VStack{
            TextField("id", text: $id)
            TextField("Наименование", text: $nameAbonement)
            TextField("Стоимость", text: $costAbonement)
            TextField("Номер бонусной программы", text: $bonus)
            DatePicker("Дата начала", selection: $dateSart, displayedComponents: .date)
            DatePicker("Дата конца  ", selection: $dateFinish, displayedComponents: .date)
            HStack{
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    let df = DateFormatter()
                   df.dateFormat = "yyyy-MM-dd"
                   let dstart = df.string(from: dateSart)
                   let dfinish = df.string(from: dateFinish)
                    
                    guard let url = URL(string: "http://127.0.0.1:8000/api/abonement/\(id)") else {
                          print("error1")
                          return
                      }
                      var request = URLRequest(url: url)
                      request.httpMethod = "PUT"
                      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      let body: [String: AnyHashable] = [
                        "name_abonement" : nameAbonement,
                        "cost_abonement" : costAbonement,
                        "date_start" : dstart,
                        "date_finish" : dfinish,
                        "bonus_programms_id" : bonus
                  
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

struct AbonementEdit_Previews: PreviewProvider {
    static var previews: some View {
        AbonementEdit(isVisible: .constant(true))
    }
}

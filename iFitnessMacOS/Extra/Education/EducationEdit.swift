//
//  EducationEdit.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 07.12.2021.
//

import SwiftUI

struct EducationEdit: View {
    @State var id = String()
    @State var quailifaction = String()
    @State var stage = String()
    @State var registration_number = String()
    @State var serial_number = String()
    @State var institution = String()
    @State var worker_id = String()
    @State var date_ofissue = Date()
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack{
            TextField("id", text: $id)
            TextField("Квалификация", text: $quailifaction)
            TextField("Степень", text: $stage)
            TextField("Регистрационный номер", text: $registration_number)
            TextField("Серийный номер", text: $serial_number)
            TextField("Образовательное учреждение", text: $institution)
            TextField("Номер сотрудника", text: $worker_id)
            DatePicker("Дата выдачи", selection: $date_ofissue, displayedComponents: .date)
            HStack{
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Изменить"){
                    let df = DateFormatter()
                   df.dateFormat = "yyyy-MM-dd"
                   let now = df.string(from: date_ofissue)
                   
                   guard let url = URL(string: "http://127.0.0.1:8000/api/education/\(id)") else {
                         print("error!")
                         return
                     }
                     var request = URLRequest(url: url)
                     request.httpMethod = "PUT"
                     request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                     let body: [String: AnyHashable] = [
                         "quailifaction" : quailifaction,
                         "stage" : stage,
                         "registration_number" : registration_number,
                         "serial_number" : serial_number,
                         "institution" : institution,
                         "date_ofissue" : now,
                         "workers_id" : worker_id
                 
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

struct EducationEdit_Previews: PreviewProvider {
    static var previews: some View {
        EducationEdit(isVisible: .constant(true))
    }
}

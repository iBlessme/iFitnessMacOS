//
//  EducationDelete.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 07.12.2021.
//

import SwiftUI

struct EducationDelete: View {
    @Binding var isVisible: Bool
    @State var id = String()
    var body: some View {
        VStack{
            TextField("Введите ID", text: $id)
            HStack{
                Button("Закрыть"){
                    self.isVisible = false
                }
                Button("Добавить"){
                    guard let url = URL(string: "http://127.0.0.1:8000/api/education/\(id)") else {
                        print("Не удалось подключиться к API")
                        return
                    }
                    var request = URLRequest(url: url)
                    request.httpMethod = "DELETE"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    URLSession.shared.dataTask(with: request) {data, response, error in
                        do{
                            self.isVisible = false
                            let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                            print("Success: \(response)")
                            self.isVisible = false
                        }catch{
                            print(error)
                        }
                      
                        
                    }
                    .resume()
                }
                .background(Color.accentColor)
            }
        }
    }
}

struct EducationDelete_Previews: PreviewProvider {
    static var previews: some View {
        EducationDelete(isVisible: .constant(true))
    }
}

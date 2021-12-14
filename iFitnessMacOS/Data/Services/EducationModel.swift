//
//  EducationModel.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 07.12.2021.
//

import Foundation

public class EducationModel: ObservableObject{
    @Published var educations: [Education] = []
    
    func fetch(completion: @escaping ([Education]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/education") else {
            print("Не удалось подулючиться к API")
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, rosponse, error) in
            if let data = data {
                let decodeList = try! JSONDecoder().decode([Education].self, from: data)
                print(decodeList)
                DispatchQueue.main.async {
                    completion(decodeList)
                }
            }else{
                print("Не удалось получить данные")
            }
        }
        .resume()
    }
}

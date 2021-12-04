//
//  AbonementModel.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import Foundation

public class AbonementModel: ObservableObject{
    @Published var abonements:[Abonements] = []
    func fetch(completion: @escaping ([Abonements]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/abonement") else {
            print("Неправильная ссылка")
            return
        }
   
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data = data {
            let abonements = try! JSONDecoder().decode([Abonements].self, from: data)
            print(abonements)
            DispatchQueue.main.async {
                completion(abonements)
            }
            }else{
                print("Не удалось получить данные")
            }
        }
        .resume()
    }
}

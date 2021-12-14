//
//  TypesOfInventoryModel.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 07.12.2021.
//

import Foundation

public class TypesOfInventoryModel: ObservableObject{
    @Published var typesOfInventory: [TypesOfInventory] = []
    
    func fetch(completion: @escaping ([TypesOfInventory]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/typesOfInventory") else {
            print("Не удалось подключится к API")
            return
        }
        
        URLSession.shared.dataTask(with: url){data, response, error in
            if let data = data {
                let decodeList = try! JSONDecoder().decode([TypesOfInventory].self, from: data)
                DispatchQueue.main.async {
                    print(decodeList)
                        completion(decodeList)
                }
            }else{
                print("Не удалось получить данные из БД")
            }
        }
        .resume()
    }
    
}

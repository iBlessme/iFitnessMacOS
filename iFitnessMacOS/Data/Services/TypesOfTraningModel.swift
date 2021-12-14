//
//  TypesOfTraningModel.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 08.12.2021.
//

import Foundation

public class TypesOfTraningModel: ObservableObject{
    @Published var typesOfraningModel: [TypesOfTraning] = []
    
    func fetch(competion: @escaping ([TypesOfTraning]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/typesOfTraning") else{
            print("Не удалось подключиться к API")
            return
        }
        
        URLSession.shared.dataTask(with: url){data, response, error in
            if let data = data {
                let decodeList = try! JSONDecoder().decode([TypesOfTraning].self, from: data)
                DispatchQueue.main.async {
                    print(decodeList)
                    competion(decodeList)
                }
            }else{
                print("Не удалось получить данные БД")
            }
            
        }.resume()
    }
    
    
}

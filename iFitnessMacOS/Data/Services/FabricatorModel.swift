//
//  FabricatorModel.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 08.12.2021.
//

import Foundation

public class FabricatorModel: ObservableObject{
    @Published var fabricatorModel: [Fabricator] = []
    
    func fetch(competion: @escaping ([Fabricator]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/fabricator") else {
            print("Не удалось подключиться к API")
            return
        }
        URLSession.shared.dataTask(with: url){data, response, error in
            if let data = data {
                let decodeList = try! JSONDecoder().decode([Fabricator].self, from: data)
                DispatchQueue.main.async {
                    print(decodeList)
                    competion(decodeList)
                }
            }
            else{
                print("Не удалось подключиться к БД")
            }
        }
        .resume()
        
    }
}

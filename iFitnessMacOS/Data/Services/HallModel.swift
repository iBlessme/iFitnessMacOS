//
//  HallModel.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 08.12.2021.
//

import Foundation

public class HallModel: ObservableObject{
    @Published var hallModel: [Hall] = []
    
    func fetch(competion: @escaping ([Hall])->()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/hall") else
        {
            print("Не удалось подключиться к API")
            return
        }
        
        URLSession.shared.dataTask(with: url){data, response, error in
            if let data = data {
                let decodeList = try! JSONDecoder().decode([Hall].self, from: data)
                DispatchQueue.main.async {
                    print(decodeList)
                    competion(decodeList)
                }
            }else{
                print("Не удалось получить данные из БД")
            }
        }
        .resume()
    }
}

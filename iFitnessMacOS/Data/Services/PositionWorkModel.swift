//
//  PositionWorkModel.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 07.12.2021.
//

import Foundation

public class PositionWorkModel: ObservableObject{
    @Published var positions: [PositionWork] = []
    
    func fetch(completion: @escaping ([PositionWork]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/positionWork") else{
            print("Не удалось подключится к API")
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let data = data {
                let decodeList = try! JSONDecoder().decode([PositionWork].self, from: data)
                DispatchQueue.main.async {
                    print(decodeList)
                    completion(decodeList)
                }
            }
            else{
                
                print("Не удалось подключиться к ссылке")
            }
        }
        .resume()
    }
}

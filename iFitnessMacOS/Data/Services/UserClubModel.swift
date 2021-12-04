//
//  UserClubData.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import Foundation

public class UserClubModel: ObservableObject{
    @Published var users: [UserClubs] = []
    
    func fetch(completion: @escaping ([UserClubs]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/userClub") else {
            print("Не удалось подключиться к ссылке")
            return
        }
        URLSession.shared.dataTask(with: url){(data, response, error) in
            if let data = data {
                let decodeList = try! JSONDecoder().decode([UserClubs].self, from: data)
                DispatchQueue.main.async {
                    completion(decodeList)
                    print("test")
                }
            }
            else{
                print("Нет данных в БД")
            }
            
        }
        .resume()
    }
    }

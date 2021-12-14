//
//  BonusProgramModel.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import Foundation

public class BonusProgramModel: ObservableObject{
    @Published var bonusProgramms:[BonusProgram] = []
    func fetch(completion: @escaping ([BonusProgram]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/bonus_programm") else {
            print("Неправильная ссылка")
            return
        }
   
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do{
            if let data = data {
            let decodeList = try! JSONDecoder().decode([BonusProgram].self, from: data)
            print(decodeList)
            DispatchQueue.main.async {
                completion(decodeList)
            }
            }else{
                print("Не удалось получить данные")
            }
            }catch{
                print(error)
            }
        }
        .resume()
    }
}

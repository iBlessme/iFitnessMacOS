//
//  MainAdminView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import SwiftUI

struct MainAdminView: View {
    var body: some View {
        NavigationView{
        List{
            DisclosureGroup("Пользователи"){
               NavigationLink("Все пользователи", destination: UserClubsView())
                NavigationLink("Сотрудники", destination: WorkersListView())
                NavigationLink("Клиенты", destination: ClientsView())
                }
            }
        }
    }
}

struct MainAdminView_Previews: PreviewProvider {
    static var previews: some View {
        MainAdminView()
    }
}

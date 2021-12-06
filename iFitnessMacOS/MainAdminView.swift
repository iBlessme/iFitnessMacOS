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
            DisclosureGroup("Магазин"){
                NavigationLink("Абонемент", destination: AbonementView())
                NavigationLink("Бонусная программа", destination: BonusProgramView())
            }
            DisclosureGroup("Инвентарь"){
                NavigationLink("Тип тренировки", destination: TypesTraningView())
                NavigationLink("Залы", destination: HallView())
                NavigationLink("Тип инвентаря", destination: TypesInventoryView())
                NavigationLink("Производители", destination: FabricatorView())
            }
            DisclosureGroup("Дополнительные"){
                NavigationLink("Образование",destination: EducationView())
                NavigationLink("Должности", destination: PositionView())
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

//
//  EducationView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 06.12.2021.
//

import SwiftUI

struct EducationView: View {
    @State var educationModel = [Education]()
    @State private var showAdd = false
    @State private var showAEdit = false
    @State private var showDelete = false
    var body: some View {
        List(educationModel, id: \.self) {educations in
            HStack{
                Text("id: \(educations.id)")
                    .frame(width: 40)
                Divider()
                Text("Квалификация: \(educations.quailifaction)")
                Text("Стадия: \(educations.stage)")
                Divider()
                Text("\(educations.registration_number) \(educations.serial_number)")
                Divider()
                Text("Учреждение: \(educations.institution)")
                Divider()
                Text("Дата окончания: \(educations.date_ofissue)")
                
                
            }
            Divider()
        }
        .onAppear{
            EducationModel().fetch{ items in
                self.educationModel = items
            }
        }
        .toolbar{
            Button(action: {showAdd.toggle()}){
                Text("✅ Добавить")
            }
            Button(action: {showAEdit.toggle()}){
                Text("✏ Изменить")
            }
            Button(action: {showDelete.toggle()}){
                Text("✖️ Удалить")
            }
        }
        .sheet(isPresented: $showAdd){
            EducationAdd(isVisible: self.$showAdd)
        }
        .sheet(isPresented: $showAEdit){
            EducationEdit(isVisible: self.$showAEdit)
        }
        .sheet(isPresented: $showDelete){
            EducationDelete(isVisible: self.$showDelete)
        }
    }
}

struct EducationView_Previews: PreviewProvider {
    static var previews: some View {
        EducationView()
    }
}

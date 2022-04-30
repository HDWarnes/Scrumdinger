//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Hamish Warnes on 2022/04/28.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var isPresentingEditView = false
    @State private var data = DailyScrum.Data()
    
    var body: some View {
        List{
            Section(header: Text("Meeting Info")){
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .foregroundColor(.accentColor)
                        .font(.headline)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .padding(4)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){attendee in
                    Label("\(attendee.name)", systemImage: "person")
                }
            }
            Section(header: Text("History")){
                if(scrum.history.isEmpty){
                    Label("No Meetings Yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history){history in
                    HStack{
                        Image(systemName: "calender")
                        Text(history.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                isPresentingEditView = true
                data = scrum.data
            }
        }
        .sheet(isPresented: $isPresentingEditView){
            NavigationView{
                DetailEditView(data: $data)
                    .navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                isPresentingEditView = false
                                scrum.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}

//
//  PreviousGenerationsView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 25/2/23.
//

import SwiftUI

struct PreviousGenerationsView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State var searchText = ""
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Formula1", size: 30)!]
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Formula1", size: 15)!]
        
    }
    
    var searchResults: [Telemetry] {
        if searchText.isEmpty {
            return viewModel.telemetries
        } else {
            return viewModel.telemetries.filter { $0.id.contains(searchText) }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            List(searchResults, id: \.id) { telemetry in
                
                NavigationLink(destination: {
                    DetailedPGView(year: telemetry.year, grandPrix: telemetry.grandPrix, session: telemetry.session, driver1: telemetry.driver1, driver2: telemetry.driver2)
                }, label: {
                    PreviousGenerationsRow(year: telemetry.year, grandPrix: telemetry.grandPrix, session: telemetry.session, driver1: telemetry.driver1, driver2: telemetry.driver2)
                })
                .swipeActions(edge: .trailing) {
                    Button {
                        viewModel.removeTelemetry(withId: telemetry.id)
                    } label: {
                        Text("pg.swipeact.remove")
                    }
                    .tint(.red)
                }
                
            }
            .navigationTitle(Text("pg.nav.title"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $searchText, prompt: "pg.searchbar.prompt")
    }
}

struct PreviousGenerationsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousGenerationsView()
    }
}

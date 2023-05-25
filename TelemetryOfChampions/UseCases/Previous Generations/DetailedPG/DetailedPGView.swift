//
//  DetailedPGView.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 25/2/23.
//

import SwiftUI
import Kingfisher

struct DetailedPGView: View {
    
    @State var year: Int
    @State var grandPrix: String
    @State var session: String
    @State var driver1: String
    @State var driver2: String
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        let url = URL(string: "http://**serverip**:81/telemetry/?year=\(year)&grand_prix=\(grandPrix)&session=\(session)&driver1=\(driver1)&driver2=\(driver2)")
        
            
        ScrollView {
            VStack {
                
                VStack {
                    
                    // MARK: - Track info
                    ZStack {
                        
                        Rectangle()
                            .frame(width: 350, height: 150)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                        
                        HStack {
                            
                            
                            Image("\(grandPrix.lowercased())")
                                .resizable()
                                .frame(width: 150, height: 125, alignment: .center)
                                .clipped()
                                .scaledToFit()
                                .padding(.leading)
                            
                        }
                        .padding(.trailing, 210)
                        
                        HStack {
                            
                            ZStack {
                                
                                Image("f1intro")
                                    .resizable()
                                    .frame(width: 250, height: 150)
                                    .cornerRadius(30)
                                    .clipped()
                                    .padding(.trailing, 30)
                                    .padding(.bottom)
                                
                                Text("\(String(year))\n\(grandPrix.uppercased())\n GRAND PRIX")
                                    .foregroundColor(.black)
                                    .font(.custom("Formula1", size: 22))
                                    .multilineTextAlignment(.trailing)
                                    .padding(.bottom, 5)
                                    .padding(.top, 5)
                                    .fontWeight(.bold)
                            }
                            .padding(.trailing)
                            
                        }
                        .padding(.leading, 140)
                        
                    }
                    
                }
                .padding()
                
                HStack {
                    
                    VStack {
                        
                        // MARK: - Driver 1
                        Image(viewModel.loadImage(driverArray: viewModel.driverPickerData(year: year), searching: driver1))
                            .resizable()
                            .frame(width: 175, height: 55)
                            .clipped()
                        
                        Text(driver1)
                        
                    }
                    
                    Text("vs")
                        .font(.custom("Formula1", size: 20))
                    
                    VStack {
                        
                        // MARK: - Driver 2
                        Image(viewModel.loadImage(driverArray: viewModel.driverPickerData(year: year), searching: driver2))
                            .resizable()
                            .frame(width: 175, height: 55)
                            .clipped()
                        
                        Text(driver2)
                    }
                }
                
                KFImage(url!)
                    .placeholder {
                        LoadingView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    
                Button {
                    viewModel.saveImage(url: url!)
                } label: {
                    Text("detailedpg.button.save")
                        .font(.custom("Formula1", size: 20))
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                    
            }
            .navigationTitle("\(String(year)) \(grandPrix) GP \(session) - \(driver1) vs \(driver2)")
        .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct DetailedPGView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedPGView(year: 2022, grandPrix: "Bahrain", session: "Race", driver1: "VER", driver2: "LEC")
    }
}

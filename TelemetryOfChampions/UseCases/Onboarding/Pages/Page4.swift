//
//  Page4.swift
//  Telemetry Of Champions
//
//  Created by Adrián Castilla on 26/2/23.
//

import SwiftUI

struct Page4: View {
    
    @Binding var showOnboarding: Bool
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                
                Image("telemetryExample")
                    .resizable()
                    .frame(width: 450, height: 500)
                    .shadow(radius: 10)
                Text("onboarding.page4.intro")
                    .font(.custom("Formula1", size: 20))
                    .padding()
                    .foregroundColor(.white)
                
                Button {
                    showOnboarding.toggle()
                } label: {
                    Text("onboarding.page4.button")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .font(.custom("Formula1", size: 20))
                
            }
        }
    }
}

struct Page4_Previews: PreviewProvider {
    static var previews: some View {
        Page4(showOnboarding: .constant(true))
        
        Page4(showOnboarding: .constant(true))
            .previewDevice("iPhone SE (3rd generation)")
    }
}

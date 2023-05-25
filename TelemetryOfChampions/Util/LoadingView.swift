//
//  LoadingView.swift
//  F1Telemetry
//
//  Created by Adrián Castilla on 21/2/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
                    
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .clipped()
            ProgressView()
            Text("loadingview.text")
        }
        .font(.custom("Formula1", size: 15))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

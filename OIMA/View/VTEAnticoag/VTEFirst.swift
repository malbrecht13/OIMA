//
//  VTEFirst.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/26/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct VTEFirst: View {
    
    @ObservedObject var vte: VTEData = VTEData()
    @State private var nextView = false
    
    private let vteType = ["PE", "DVT"]
    
    private let fillColor = Color(hue: 0.67, saturation: 0.46, brightness: 0.69, opacity: 1.00)
    
    var body: some View {
        VStack {
            Spacer()
            
            ShowPicker(parentBinding: $vte.selection, text: "Select VTE type", parentArray: vteType)
            
            Button(action: {
                self.nextView = true
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: fillColor))
            
            
            NavigationLink(destination: VTEProvokingFactors(vte: VTEData()), isActive: $nextView) {
                EmptyView()
            }
            
            Spacer()
            
            Text("An algorithm to decide on anticoagulant and duration of therapy in VTE disease.").padding().font(.caption)
            
            

            }.navigationBarTitle("VTE home", displayMode: .inline)
        
        
            
    }
}

struct VTEFirst_Previews: PreviewProvider {
    static var previews: some View {
        VTEFirst()
    }
}

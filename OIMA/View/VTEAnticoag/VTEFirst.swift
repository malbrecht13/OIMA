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
    @State private var nextView: String? = nil
    
    private let vteType = ["PE", "DVT"]
    private let occurrences = ["First", "Second or greater"]

    
    var body: some View {
        VStack {
            Spacer()
            
            ShowPicker(parentBinding: $vte.selection, text: "Select VTE type", parentArray: vteType)
            ShowPicker(parentBinding: $vte.occurrence, text: "Select number of VTE occurrences", parentArray: occurrences).minimumScaleFactor(0.5)
            
            Button(action: {
                if self.vte.selection == 0 {
                    self.nextView = "PE"
                } else if self.vte.selection == 1 {
                    self.nextView = "DVT"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: purple))
            
            
            NavigationLink(destination: VTEProvokingFactors(vte: VTEData()), tag: "PE", selection: $nextView) {
                EmptyView()
            }
            NavigationLink(destination: ProximalDistalDVT(vte: VTEData()), tag: "DVT", selection: $nextView) {
                EmptyView()
            }
            
            Spacer()
            
            Text("This algorithm helps with choosing an anticoagulant.  It also helps in determining duration of therapy in VTE disease.").padding()
            
            

            }.navigationBarTitle("VTE home", displayMode: .inline)
        
        
            
    }
}

struct VTEFirst_Previews: PreviewProvider {
    static var previews: some View {
        VTEFirst()
    }
}

//
//  VTEManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/27/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct VTEManagement: View {
    
    @ObservedObject var vte: VTEData
    
    private let LMWH = ["Enoxaparin 1 mg/kg q12", "Dalteparin 200 units/kg/day divided qd-bid (18,000U max per dose)"]
    
    var body: some View {
        VStack {
            Text("Management")
                .fontWeight(.black)
                .modifier(ManagementMod(textColor: purple))
            Text("First line therapy").underline().padding()
            VStack(alignment: .leading) {
                if vte.malignancy {
                    Text("You've indicated the patient has active malignancy.\n")
                    Text("First-line options: ")
                        ForEach(LMWH, id: \.self) { treatment in
                            Text(treatment)
                    }
                }
            }.padding().font(.caption)
            
            Spacer()
        }
    }
    
    
}

//TODO: - VTE Bleed Score calculation
func vteBleedScore() -> Double {
    return 0.0
}

struct VTEManagement_Previews: PreviewProvider {
    static var previews: some View {
        VTEManagement(vte: VTEData())
    }
}

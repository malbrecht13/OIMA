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
    private let DOACindefinite = ["Apixaban 10 mg PO BID x 7 days, then 5 mg PO BID for 6 months, then 2.5 mg bid thereafter", "Rivaraxoban 15 mg PO BID x 21 days, then 20 mg PO qd for 6 months, then 10 mg thereafter", "Dabigatran 150 mg after parenteral anticoagulation for 5 days"]
    
    var body: some View {
        VStack {
            Text("Management")
                .fontWeight(.black)
                .modifier(ManagementMod(textColor: purple))
            VStack(alignment: .leading) {
                
                //if patient has active cancer
                if vte.malignancy {
                    Text("You've indicated the patient has active malignancy.")
                    
                    Text("\nIndefinite therapy should be used for most patients with active cancer.  However, management decisions are complex and must be indidualized and based on patient input.")
                    
                    
                    Text("\nFirst-line options:").underline()
                    ForEach(DOACindefinite, id: \.self) { treatment in
                        Text("• " + treatment)
                    }
                    Text("\nSecond-line options: ").underline()
                        ForEach(LMWH, id: \.self) { treatment in
                            Text("• " + treatment)
                        }
                    Text("• Warfarin, overlap with heparin until INR therapeutic")
                    
                    Text("\nNote: LMWH is first-line if patient has severe liver disease with coagulopathy or if they have a GI/GU cancer.")
                  // if patient has a distal DVT
                } else if vte.proxDistSelection == 1 {
                    
                }
                }.font(.caption)
            
            Spacer()
        }.padding(.horizontal)
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

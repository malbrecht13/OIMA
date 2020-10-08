//
//  OutCAPManagement.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/8/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct OutCAPManagement: View {
    
    @ObservedObject var capToggle: CAPData
    
    var body: some View {
 
        ScrollView {
            VStack {
                Group {
                    Text("Management")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Color.pink)
                        .padding()
                        .padding(.top, 50)
                    }
                    
                    
                //outpatient CAP with risk factors
                if capToggle.selection == 0 {
                    VStack (alignment: .leading) {
                        Group {
                            Text("You've indicated that the patient has risk factors for MRSA or Pseudomonas.\n")
                            Text("Treat using the following combination therapy:").fontWeight(.bold).underline().multilineTextAlignment(.center)
                            Text("\n*Renal dosing may be necessary.*")
                            Text("\nChoose one of these:\n").fontWeight(.bold)
                            Text("Amoxicillin/clavulanate 500mg/125mg PO TID\nAmoxicillin/clavulanate 875 mg/125 mg PO BID\nCefpodoxime 200 mg PO BID\nCefuroxime 500 mg PO BID")
                            
                            Text("\nAND one of these:").fontWeight(.bold)
                            
                            Text("\n\nAzithromycin 500 mg day 1, then 250 mg daily for 4 days").lineLimit(2).minimumScaleFactor(0.5)
                            Text("Clarithromycin 500 mg PO BID\nClarithromycin ER 1000 mg PO daily\nDoxycycline 100 mg PO BID")
                        }
                        Group {
                            Text("\nOR").fontWeight(.bold).underline()
                            Text("\nMonotherapy with a respiratory fluoroquinolone:").fontWeight(.bold).underline().multilineTextAlignment(.center)
                            Text("\nChoose one of these:").fontWeight(.bold)
                            Text("Levofloxacin 750 mg PO daily\nMoxifloxacin 400 mg PO daily\nGemifloxacin 320 mg PO daily")
                        }
                        Text("\nTreatment duration is 5 days unless patients fail to improve.")
                    }.font(.footnote).padding(.horizontal)
                }
                
                if capToggle.selection == 1 {
                    VStack(alignment: .leading) {
                        Text("You've indicated that the patient does not have risk factors for MRSA or Pseudomonas.\n")
                        Text("Treat using the following therapy:").fontWeight(.bold).underline().multilineTextAlignment(.center)
                        Text("\n*Renal dosing may be necessary.*")
                        Text("\nChoose one of these:\n").fontWeight(.bold)
                        Text("Amoxicillin 1 g PO TID\nDoxycycline 100 mg PO BID")
                        Text("Azithromycin 500 mg day 1, then 250 mg daily for 4 days").lineLimit(2).minimumScaleFactor(0.5)
                        Text("Clarithromycin 500 mg PO BID\nClarithromycin ER 1,000 mg PO daily")
                        Text("\nNote: macrolides should be used as monotherapy only if local pneumococcal resistance is < 25%")
                        Text("\nTreatment duration is 5 days unless patients fail to improve.")
                    }.font(.footnote).padding(.horizontal)
                }

            }
            .edgesIgnoringSafeArea(.top).padding(.bottom, 50)
        }
    }
    
    
}

struct OutCAPManagement_Previews: PreviewProvider {
    static var previews: some View {
        OutCAPManagement(capToggle: CAPData())
    }
}

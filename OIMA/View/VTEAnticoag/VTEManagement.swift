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
    private let DOACindefinite = ["Apixaban 10 mg PO BID x 7 days, then 5 mg PO BID for 6 months, then 2.5 mg bid thereafter", "Rivaroxoban 15 mg PO BID x 21 days, then 20 mg PO qd for 6 months, then 10 mg thereafter", "Dabigatran 150 mg PO BID after parenteral anticoagulation for 5 days"]
    private let DOAC3Months = ["Apixaban 10 mg PO BID x 7 days, then 5 mg PO BID x 3 months, then stop", "Rivaroxaban 15 mg PO BID x 21 days, then 20 mg PO qd x 3 months, then stop", "Dabigatran 150 mg PO BID after parenteral anticoagulation for 5 days"]
    
    var body: some View {
        VStack {
            Text("Management")
                .fontWeight(.black)
                .modifier(ManagementMod(textColor: purple))
            VStack(alignment: .leading) {
                Text("\(vteBleedScore())")
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
                  
                }
                
                // if patient has a distal DVT
                if vte.proxDistSelection == 1 {
                    Text("You've indicated the patient has a distal DVT")
                    if vte.severeSymptoms == 0 {
                        Text("You've indicated that symptoms for the DVT were not severe.")
                        Text("\nIf no severe symptoms or major risk factors for clot extension, can do serial imaging for 2 weeks without anticoagulation.  If repeat ultrasound shows clot extension, consider providing anticoagulation for 3 months, then stop.")
                    } else if vte.severeSymptoms == 1 {
                        Text("You've indicated that the distal DVT caused severe symptoms.")
                        Text("\nConsider treating for 3 months, then stop, particularly if bleed risk is not high.")
                    }
                } else if vte.proxDistSelection == 0 {
                    //TODO: - provoked
                    //TODO: - unprovoked
                        //1st instance low bleed risk
                        //1st instance high bleed risk
                        //2nd instance low bleed risk
                        //2nd instance high bleed risk
                }
                }.font(.caption)
            
            Spacer()
        }.padding(.horizontal)
    }
    
    
}



extension VTEManagement {
    /// Calculates the VTE-Bleed score.  Starts with the bleedRFCount and adds points based on the VTEScoring system
    /// - Returns: VTE-Bleed score embedded in a string message based on how high the score is.
    func vteBleedScore() -> String {
        
        //age > 60 1.5 points
        //previous bleeding 1.5 points
        //active cancer 2 points
        //renal insufficiency/failure 1.5 points
        //anemia 1.5 points
        //male patient with uncontrolled htn 1.0 point
        //Low risk is < 2 points
        //High risk is >= 2 points
        
        let startingBleedScore = Double(vte.bleedRFCount)
        print(startingBleedScore)
        
        var finalBleedScore = startingBleedScore
        
        if vte.age60 {
            finalBleedScore += 0.5
        }
        if vte.previousBleed {
            finalBleedScore += 0.5
        }
        if vte.activeCancer {
            finalBleedScore += 1.0
        }
        if vte.renalFailure {
            finalBleedScore += 0.5
        }
        if vte.anemia {
            finalBleedScore += 0.5
        }
        
        print(finalBleedScore)
        
        let firstMessage = "VTE-Bleed score is \(String(format: "%.1f", finalBleedScore)). "
        var secondMessage = ""
        if finalBleedScore < 2.0 {
            secondMessage = "This indicates a low bleeding risk."
        } else {
            secondMessage = "This indicates a high bleeding risk."
        }
        
        return firstMessage + secondMessage
    }
}


struct VTEManagement_Previews: PreviewProvider {
    static var previews: some View {
        VTEManagement(vte: VTEData())
    }
}

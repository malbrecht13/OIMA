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
    private let DOAC3Months = ["Apixaban 10 mg PO BID x 7 days, then 5 mg PO BID", "Rivaroxaban 15 mg PO BID x 21 days, then 20 mg PO qd", "Dabigatran 150 mg PO BID after parenteral anticoagulation for 5 days"]
    
    var body: some View {
        VStack {
            Text("Management")
                .fontWeight(.black)
                .modifier(ManagementMod(textColor: purple))
            VStack(alignment: .leading) {
                //if patient has active cancer
                if vte.malignancy {
                    Text("You've indicated the patient has active malignancy.")
                    
                    Text("\nIndefinite therapy should be used for most patients with active cancer.  However, management decisions are complex and must be individualized and based on patient input.")
                    
                    Text("\nNote: LMWH is first-line if patient has severe liver disease with coagulopathy or if they have a GI/GU cancer.")
                  //Distal DVT
                } else if vte.proxDistSelection == 1 {
                    Text("You've indicated the patient has a distal DVT.")
                    //no severe symptoms
                    if vte.severeSymptoms == 1 {
                        Text("\nYou've indicated that symptoms for the DVT were not severe.")
                        Text("\nIf no severe symptoms or major risk factors for clot extension, can do serial imaging for 2 weeks without anticoagulation.  If repeat ultrasound shows clot extension, consider providing anticoagulation for 3 months, then stop.")
                    //severe symptoms
                    } else if vte.severeSymptoms == 0 {
                        Text("\nYou've indicated that the distal DVT caused severe symptoms.")
                        Text("\nConsider treating for 3 months, then stop.")
                    }
                } else if vte.proxDistSelection == 0 {
                    //provoked
                    if vte.provokedCount > 0 {
                        //provoked, 1st occurrence
                        if vte.occurrence == 0 {
                            Text("You've indicated that there were transient risk factors that may have caused the VTE. Treat for 3 months, then consider stopping.")
                        //provoked, 2nd or greater occurrence
                        } else {
                            //provoked, 2nd occurrence, low bleeding risk
                            Text("You've indicated that there were transient risk factors that may have caused the VTE. But since this is recurrent VTE, consider indefinite anticoagulation.")
                            //provoked, 2nd occurrence, high bleeding risk
                            if vteBleedScore() > 2.0 {
                                Text("\nHowever, also note that VTE-Bleed score is \(String(format: "%.1f", vteBleedScore())). This indicates a high bleeding risk.  3 months of anticoagulation or indefinite anticoagulation are both acceptable depending on the perceived risk-benefit ratio of anticoagulation.")
                            }
                        }
                        
                    } else {
                        //unprovoked
                        Text("The VTE was unprovoked.")
                        //high bleed risk
                        if vteBleedScore() >= 2.0 {
                            Text("\nVTE-Bleed score is \(String(format: "%.1f", vteBleedScore())). This indicates a high bleeding risk.")
                            //unprovoked, high bleed risk, 1st occurrence
                            if vte.occurrence == 0 {
                                Text("\nSince this was the first occurrence of unprovoked VTE with high bleed risk, consider stopping anticoagulation after 3 months.")
                                //unprovoked, high bleed risk, 2nd occurrence
                            } else if vte.occurrence == 1 {
                                Text("\nSince this is recurrent unprovoked VTE with a high bleeding risk, could consider stopping anticoagulation after 3 months if you and the patient feel the bleeding risk outweighs the recurrent VTE risk.")
                            }
                            Text("\nConsider long-term aspirin therapy after stopping anticoagulation.")
                        //low bleed risk
                        } else if vteBleedScore() < 2.0 {
                            Text("\nVTE-Bleed score is \(String(format: "%.1f", vteBleedScore())).  This indicates a low bleeding risk.")
                            //unprovoked, low bleed risk, 1st occurrence
                            if vte.occurrence == 0 {
                                Text("\nSince this is the first occurrence of unprovoked VTE with low bleed risk, consider providing indefinite anticoagulation.")
                            //unprovoked, low bleed risk, 2nd occurrence
                            } else if vte.occurrence == 1 {
                                Text("\nSince this is recurrent unprovoked VTE with low bleed risk, provide indefinite anticoagulation.")
                            }
                        }
                    }
                    
                }
                //if VTE occurred on recurrent anticoagulation
                if vte.occurrence == 1 && vte.vteOnAnticoag == 0 {
                    Text("\nSince the VTE occurred while on chronic anticoagulation, consider switching to Low-molecular weight heparin (LMWH) for at least one month.  If the VTE occurred while already on LMWH, consider increasing the dose of LMWH by one-quarter to one-third.")
                    
                    // indefinite therapy
                } else if vte.provokedCount == 0 && vteBleedScore() < 2.0 {
                    Text("\nFirst-line options:").underline()
                    ForEach(DOACindefinite, id: \.self) { treatment in
                        Text("• " + treatment)
                    }
                    Text("\nSecond-line options: ").underline()
                    Text("• Warfarin, overlap with heparin until INR therapeutic")
                    ForEach(LMWH, id: \.self) { treatment in
                        Text("• " + treatment)
                    }
                    // 3 months therapy
                } else {
                    Text("\nFirst-line options:").underline()
                    ForEach(DOAC3Months, id: \.self) { treatment in
                        Text("• " + treatment)
                    }
                    Text("\nSecond-line options: ").underline()
                    Text("• Warfarin, overlap with heparin until INR therapeutic")
                    ForEach(LMWH, id: \.self) { treatment in
                        Text("• " + treatment)
                    }
                }
                Text("\nNote: If patient has severe liver disease with coagulopathy, LMWH is the treatment of choice.")
                
                }.font(.caption)
            
            Spacer()
            Text("***Please note: this algorithm tried to make decision-making as simple as possible, but there are nuances that may not be addressed here.  For instance, D-dimer levels are sometimes checked to assess for need for continued anticoagulation.  Subsegmental PEs may not need any treatment if patient has low risk for recurrence. For whatever decision is made, patient preferences must also be taken into account. If it is still unclear what the best decision is after discussion with the patient, a referral to a hematologist is likely appropriate.").padding().font(.caption)
        }.padding(.horizontal)
    }
    
    
}



extension VTEManagement {
    /// Calculates the VTE-Bleed score.  Starts with the bleedRFCount and adds points based on the VTEScoring system
    /// - Returns: VTE-Bleed score embedded in a string message based on how high the score is.
    func vteBleedScore() -> Double {
        
        //age > 60 1.5 points
        //previous bleeding 1.5 points
        //active cancer 2 points
        //renal insufficiency/failure 1.5 points
        //anemia 1.5 points
        //male patient with uncontrolled htn 1.0 point
        //Low risk is < 2 points
        //High risk is >= 2 points
        
        
        var finalBleedScore = 0.0
        
        if vte.age60 {
            finalBleedScore += 1.5
        }
        if vte.previousBleed {
            finalBleedScore += 1.5
        }
        if vte.activeCancer {
            finalBleedScore += 2.0
        }
        if vte.renalFailure {
            finalBleedScore += 1.5
        }
        if vte.anemia {
            finalBleedScore += 1.5
        }
        
        if vte.maleHTN {
            finalBleedScore += 1.0
        }
        
        if finalBleedScore < 0 {
            finalBleedScore = 0.0
        }
        
        
        return finalBleedScore
    }
}


struct VTEManagement_Previews: PreviewProvider {
    static var previews: some View {
        VTEManagement(vte: VTEData())
    }
}

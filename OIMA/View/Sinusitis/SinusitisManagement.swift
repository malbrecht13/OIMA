//
//  SinusitisManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/30/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

/*
 Defintions:
 
 acute viral URI = considered if there is lack of purulence
 acute rhinosinusitis = purulent sinusitis + either nasal obstruction or facial symptoms or both
 acute viral rhinosinusitis = acute rhinosinusitis that doesn't meet bacterial definition
 acute bacterial rhinosinusitis = acute rhinosinusitis that doesn't start to improve over 10 days, or improves but then gets worse within 10 days
 acute bacterial rhinosinusitis with complication suspected = acute bacterial rhinosinusitis with proptosis, periorbital swelling, cranial nerve palsy, and/or severe headache
 
 chronic rhinosinusitis - presence of two or more symptoms of sinusitis for greater than 12 weeks, plus signs of inflammation such as turbinate edema, 
 
 */

import SwiftUI

struct SinusitisManagement: View {
    
    @ObservedObject var sinusitis: SinusitisData
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Management").fontWeight(.black).modifier(ManagementMod(textColor: green))
                VStack {
                    if self.sinusitis.duration == 0 || (self.sinusitis.duration == 1 && self.sinusitis.subacute == 0) {
                        //acute viral URI
                        if !(sinusitis.purulent && (sinusitis.obstruction || sinusitis.faceSymptoms)) {
                            Text("Patient does not meet criteria for rhinosinusitis.  They may have a viral URI or another cause.  Treat symptoms if needed.  Treatments can include analgesics (acetaminophen, ibuprofen), nasal saline, oral decongestants for up to 3 to 5 days, intranasal corticosteroids, and cough suppressants.")
                        }
                        //acute rhinosinusitis (ARS)
                        if (sinusitis.purulent && (sinusitis.obstruction || sinusitis.faceSymptoms)) {
                            //viral ARS
                            if !(sinusitis.notImproved10Days || sinusitis.worsenIn10Days) {
                                Text("Patient meets criteria for acute viral rhinosinusitis. Treatments can include analgesics (acetaminophen, ibuprofen), nasal saline, oral decongestants for up to 3 to 5 days, intranasal corticosteroids, and cough suppressants.  If patient improves and then worsens within 10 days of symptom onset, or if patient fails to start improving after 10 days have passed, antibiotics could be considered.")
                            } else if sinusitis.notImproved10Days || sinusitis.worsenIn10Days {
                                
                                VStack (alignment: .leading) {
                                    //complication suspected
                                    Text("\nYou've indicated that the patient has symptoms that could suggest a complication.  Consider obtaining CT of the sinuses.  If complication is present consider ENT consultation and/or hospitalization.")
                                    
                                    //complication not suspected
                                    Text("\nPatient meets criteria for acute bacterial rhinosinusitis.  Symptomatic relief may be offered with analgesics (NSAIDs or acetaminophen), intranasal coritocosteroids, and hypertonic (3-5%) saline irrigation, and/or topical or oral decongestants for up to 3-5 days.  2nd-gen antihistamines (e.g., loratadine, cetirizine, fexofenadine) can be considered in patients with allergies, but not other patients.  Watchful waiting without antibiotics can be considered in uncomplicated cases, with an antibiotic started if patient worsens (an antibiotic can be prescribed with instructions to fill the script if they fail to improve within 7 days or if they worsen at any time).  91% of antibiotic-treated patients improve vs. 86% placebo-treated patients.  Benefits of antibiotics, even in bacterial illness, are mild. Complete cure/resolution of symptoms could take up to 14 days or longer.")
                                    Text("\nIf severe infection or over 65, antibiotic of choice is amoxicillin/ clavulanate 2000 mg/125 mg ER tablet PO q12h x 10 days. Take with food or milk.")
                                    Text("\nIf younger than 65 with non-severe infection, can use amoxicillin/ clavnulanate 875/125 mg PO q12h x 5 days.  Take with food or milk.")
                                    Text("\nIf penicillin-allergic, use doxycycline, a respiratory fluoroquinolone (e.g., levofloxacin, moxifloxacin, or clindamycin plus cefixime or cefpodoxime.  Do not use macrolides or trimethoprim-sulfamethoxazole due to resistance.")
                                    Text("\nIf fails to start to improve after 7 days or significant worsening, reassess for complications.  Consider switching antibiotics.")
                                }
                                
                                
                            }
                        }
                    
                    //else if chronic symptoms
                    } else {
                        
                        VStack (alignment: .leading) {
                            Text("\nYou've indicated the patient has a presentation resembling chronic rhinosinusitis (CRS).")
                            
                            if sinusitis.inflammationSigns == 0 {
                                //patient meets criteria for CRS (sinusitis.inflammationSigns == 0 && sinusitis.symptomsCount >= 2)
                                Text("\nThe patient meets criteria for chronic rhinosinusitis (CRS).  If further confirmation of the diagnosis is needed, consider CT of the paranasal sinuses.  CT should also be considered to rule out aggressive infections or neoplastic disease.  It should also be performed prior to endoscopic sinus surgery.  Asthma should be ruled out in this patient and treated if present.  Cyststic fibrosis, immunocompromised state, ciliary dyskinesia should also be considered, but are less common.  Testing immunoglobulins for deficiency may be considered. It is optional to perform allergy skin testing in those with allergic symptoms.  \n\nChronic therapy includes chronic topical intranasal corticosteroids as well as saline nasal irrigation.  ")
                            } else {
                                //if patient has chronic symptoms but does not meet criteria for CRS
                                Text("\nHowever, patient does not meet diagnostic criteria for CRS.  If patient has had a prolonged or complicated clinical course, consider CT imaging to look for CRS or other findings.  Recurrent acute rhinosinusitis (4 or more episodes of acute sinusitis per year) may have similar symptoms.  Immungloboluin and/or allergy testing can be considered.  Mimickers of chronic or recurrent acute sinusitis include allergic rhinitis, nonallergic rhinitis, vasomotor rhinitis, eosinophilic nonallergic rhinitis, nasal septal deformity, vascular headaches, migraine, cluster heachache, trigeminal neuralgia, or other facial pain syndrome.  Consider referral to ENT if the diagnosis remains unclear.")
                            }
                        }
                        
                        
                    }
                        Spacer()
                }.font(.footnote)
            
            }.padding(.horizontal)
        }
    }
}

struct SinusitisManagement_Previews: PreviewProvider {
    static var previews: some View {
        SinusitisManagement(sinusitis: SinusitisData())
    }
}

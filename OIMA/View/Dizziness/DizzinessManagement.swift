//
//  DizzinessManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct DizzinessManagement: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    @State private var epleyView = false
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Management").fontWeight(.black).modifier(ManagementMod(textColor: green))
                VStack(alignment: .leading) {
                    //if Dix-Hallpike is abnormal
                    if dizzy.dh == 0 {
                        Text("The patient likely has benign paroxysmal positional vertigo (BPPV).")
                        Text("\nTreatment is with canalith repositioning maneuvers.  \n\nThe Epley maneuver is particularly useful for posterior canal BPPV (the most common type of BPPV).  This can be performed in the office.  The patient can also repeat this maneuver on their own at home a few times a day to relieve symptoms.  \n\nIf the condition is not improving with these maneuvers, consider another cause or consider ENT referral.\n")
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                self.epleyView.toggle()
                            }) {
                                Text("Epley maneuver")
                            }.sheet(isPresented: $epleyView) {
                                EpleyManeuverSheet()
                                }.buttonStyle(NextButtonStyle(fillColor: green)).padding()
                            Spacer()
                        }
                        
                    }
                    //if orthostatic vitals are abnormal
                    if dizzy.ov == 0 && dizzy.symptDuration == 0 {
                        Text("\nThis patient may have orthostatic hypotension as a cause of dizziness.  \n\nRule out volume depletion.  \n\nIf not volume-depleted, other causes should be sought, including medications, neurodegenerative disorders (e.g., Parkinson's disease, multiple sclerosis), anemia, structural heart disease, arrhythmia, infection, adrenal insufficiency, diabetic autonomic neuropathy.  Treat the underlying cause.  ")
                    }
                    
                    //can show these views if the dizziness is not triggered, or if the dizziness is triggered but both the Dix-Hallpike and orthostatic vitals are normal
                    if dizzy.triggered == 1 || (dizzy.dh == 1 && dizzy.ov == 1){
                        //if HINTS exam suggests central etiology in setting of nystagmus
                        if dizzy.hints == 0 && dizzy.nystagmus {
                            Text("\nThe HINTS exam suggests central etiology.  Consider urgent referral to the emergency department to rule out stroke.")
                        }
                        //if HINTS exam suggests peripheral etiology in setting of nystagmus
                        if dizzy.hints == 1 && dizzy.nystagmus && !dizzy.neuroDeficits {
                            Text("\nThe patient has nystagmus with a negative HINTS exam.  The patient may have a peripheral vestibular disorder such as vestibular neuritis, often related to viral infection. Symptoms can include vertigo, nausea, abnormal gait with tendency to fall towards affected side.  It may take a few days to months to resolve.  Vertigo may recur in this condition.  \n\nIf no other concerning neurologic findings, refer the patient for vestibular rehabilitation.  \n\nAntihistamines and/or antinausea medications can be used up to three days at a time such as meclizine 25 mg PO q6-8 hours x 3 days.  Other options include metoclopramide, prochlorperazine, dimenhydrinate, promethazine, diazepam, lorazepam.")
                        }
                        if (dizzy.hints == 1 && dizzy.nystagmus) || !dizzy.nystagmus {
                            //Neuro deficits
                            if dizzy.neuroDeficits {
                                Text("\nYou've indicated that the patient has new focal neurologic deficits, gait or limb ataxia, or diplopia.  Neuroimaging is indicated.  If presentation suggests stroke or other acute process, referral to the emergency department is indicated.  Otherwise, patient needs MRI and/or CT brain imaging.")
                            }
                            //hearing loss
                            if dizzy.hearingLoss {
                                Text("\nYou've indicated that the patient has unilateral hearing loss.  Neuroimaging (preferably MRI) should be performed to rule out cerebrovascular disease or potentially vestibular Schwannoma.  \n\nIf vertigo with unilateral hearling loss and normal neuroimaging, Meniere's disease should be strongly considered.  These patients may have ear pain, pressure, or fullness in the affected ear, nausea/vomiting, imbalance, and/or horizontal-torsional unidirectional nystagmus during vertigo attacks.  Refer to ENT if this diagnosis is suspected.  Treatment consists of salt and caffeine restriction, and possibly a thiazide diuretic.  ENT specialists can offer other treatments as well.")
                            }
                            Group {
                                //migraine
                                if dizzy.migraine {
                                    Text("\nYou've indicated the patient has history of migraines, making vestibular migraine a possibility.  Vestibular migraines can cause vertigo as a migraine aura, but sometimes cause vertigo without headache.  Motion sensitivity and sensitivity to visual motion are common.  This condition may be treated with migraine-preventive agents.  Consider referral to a neurologist if this is suspected.")
                                }
                                //medications
                                if dizzy.medications {
                                    Text("\nYou've indicated that the patient may be on a new medication that could cause dizziness.  Consider tapering or discontinuing the medication as a form of treatment.")
                                }
                                //trauma
                                if dizzy.trauma {
                                    Text("\nYou've indicated that the patient may have had head trauma contributing to their dizziness.  Brain imaging and/or referral to neurology could be considered.")
                                }
                                //alcohol {
                                if dizzy.alcohol {
                                    Text("\nYou've indicated the patient is a heavy alcohol user.  Ethanol can cause ataxia and vertigo.  Counsel on reducing alcohol intake.")
                                }
                                //psych {
                                if dizzy.psych {
                                    Text("\nYou've indicated the patient has significant psychiatric symptoms.  Dizziness can be a somatic manifestation of psychiatric illness.  Consider this diagnosis if otherwise normal exam/workup and patient has manifestations of psych illness such as anxiety or depression.  Treatment may include antidepressants (such as SSRIs), vestibular rehab, and/or pscyhology/psychiatry referral.  ")
                                }
                                if dizzy.ov == 1 && dizzy.dh == 1 && !(dizzy.nystagmus || dizzy.neuroDeficits || dizzy.hearingLoss || dizzy.migraine || dizzy.trauma || dizzy.alcohol || dizzy.psych) {
                                    Text("\nIf no clear cause identified after using this algorithm, consider reducing or eliminating medications that might be causing dizziness.  Consider lab workup to rule out medical conditions such as anemia, hyponatremia, and many others.  If no clear cause after appropriate workup, consider referral to a specialist such as ENT or neurology.")
                                }
                        }
                        
                    }
                    
                        
                        
                        
                        Spacer()
                    }
                    
                    }.font(.footnote).padding()
                
            }.padding(.horizontal)
        }
    }
}

struct DizzinessManagement_Previews: PreviewProvider {
    static var previews: some View {
        DizzinessManagement(dizzy: DizzinessData())
    }
}

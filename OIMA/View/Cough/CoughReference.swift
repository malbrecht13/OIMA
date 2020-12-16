//
//  CoughReference.swift
//  OIMA
//
//  Created by Michael Albrecht on 11/16/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let topic = "Cough"
fileprivate let fillColor = pink

fileprivate let citations : [Citation] =  [
    Citation(first: "Irwin RS, et al. Classification of cough as a symptom in adults and management algorithms:  CHEST guideline and expert panel report ", italicized: "CHEST. ", last: "2018;153(1):196-209."),
    Citation(first: "Irwin RS, et al. Diagnosis and management of cough executive summary: ACCP evidence-based clinical practice guidelines ", italicized: "CHEST. ", last: "2006;129:1S-23S.")
]

fileprivate let sortedCitations = citations.sorted { $0.first < $1.first }

struct CoughReference: View {
    var body: some View {
        ReferenceView(sortedCitationArray: sortedCitations, topic: topic, fillColor: fillColor)
    }
}

struct CoughReference_Previews: PreviewProvider {
    static var previews: some View {
        CoughReference()
    }
}

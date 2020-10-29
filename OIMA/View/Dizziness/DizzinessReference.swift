//
//  DizzinessReference.swift
//  OIMA
//
//  Created by Michael Albrecht on 10/28/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let topic = "Dizziness"
fileprivate let fillColor = green

fileprivate let citations : [Citation] =  [
    Citation(first: "Muncie HL, Sirmans SM, James E. Dizziness: Approach to evaluation and management. ", italicized: "Am Fam Physician. ", last: "2017;95(3):154-162."),
    Citation(first: "Lanier JB, Mote MB, Clay EC.  Evaluation and management of orthostatic hypotension. ", italicized: "Am Fam Physician. ", last: "2011;84(5):527-536.")
]

fileprivate let sortedCitations = citations.sorted { $0.first < $1.first }

struct DizzinessReference: View {
    var body: some View {
        ReferenceView(sortedCitationArray: sortedCitations, topic: topic, fillColor: fillColor)
    }
}

struct DizzinessReference_Previews: PreviewProvider {
    static var previews: some View {
        DizzinessReference()
    }
}

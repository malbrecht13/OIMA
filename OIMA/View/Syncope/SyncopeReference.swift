//
//  SyncopeReference.swift
//  OIMA
//
//  Created by Michael Albrecht on 1/3/21.
//  Copyright © 2021 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let topic = "Syncope"
fileprivate let fillColor = red

fileprivate let citations : [Citation] =  [
    Citation(first: "Shen W. et al. 2017 ACC/AHA/HRS guideline for the evaluation and management of patients with syncope. ", italicized: "Circulation. ", last: "2017;136:e60-e122."),
    
]

fileprivate let sortedCitations = citations.sorted { $0.first < $1.first }

struct SyncopeReference: View {
    var body: some View {
        ReferenceView(sortedCitationArray: sortedCitations, topic: topic, fillColor: fillColor)
    }
}

struct SyncopeReference_Previews: PreviewProvider {
    static var previews: some View {
        SyncopeReference()
    }
}

//
//  VTEReferences.swift
//  OIMA
//
//  Created by Michael Albrecht on 10/28/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let topic = "Venous Thromboembolic Disease"
fileprivate let fillColor = purple

fileprivate let citations : [Citation] =  [
    Citation(first: "Kearon et al. Antithrombotic therapy for VTE disease, CHEST guidelines and expert panel report. ", italicized: "CHEST. ", last: "2016;149(2):315-352."),
]

fileprivate let sortedCitations = citations.sorted { $0.first < $1.first }

struct VTEReferences: View {
    var body: some View {
        ReferenceView(sortedCitationArray: sortedCitations, topic: topic, fillColor: fillColor)
    }
}

struct VTEReferences_Previews: PreviewProvider {
    static var previews: some View {
        VTEReferences()
    }
}

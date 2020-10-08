//
//  CAPReference.swift
//  OIMA
//
//  Created by Michael Albrecht on 10/8/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let topic = "CAP"
fileprivate let fillColor = pink

fileprivate let citations : [Citation] =  [
    Citation(first: "Metlay et al. Diagnosis and treatment of adults with community-acquired pneumonia. ", italicized: "Am J Respir Crit Care Med. ", last: "2019;200(7):e45-e67.")]

fileprivate let sortedCitations = citations.sorted { $0.first < $1.first }

struct CAPReference: View {
    var body: some View {
        ReferenceView(sortedCitationArray: sortedCitations, topic: topic, fillColor: fillColor)
    }
}

struct CAPReference_Previews: PreviewProvider {
    static var previews: some View {
        CAPReference()
    }
}

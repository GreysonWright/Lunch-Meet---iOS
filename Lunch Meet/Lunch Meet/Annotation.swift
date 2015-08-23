//
//  Annotation.swift
//  Lunch Meet
//
//  Created by greyson on 8/22/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
	
	var coordinate: CLLocationCoordinate2D
	var title: String?
	var subtitle: String?
	
	init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String?) {
		
		self.coordinate = coordinate
		self.title = title
		self.subtitle = subtitle
		
	}
	
}

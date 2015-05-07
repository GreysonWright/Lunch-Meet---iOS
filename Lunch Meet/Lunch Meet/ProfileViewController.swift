//
//  ProfileViewController.swift
//  Lunch Meet
//
//  Created by greyson on 4/30/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	@IBOutlet var profileImageView: UIImageView!
	@IBOutlet var firstNameLabel: UILabel!
	@IBOutlet var lastNameLabel: UILabel!
	@IBOutlet var groupCollectionView: UICollectionView!
	
	var groups: [Group] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
		
		firstNameLabel.text = LunchMeetSingleton.sharedInstance.user.firstName
		lastNameLabel.text = LunchMeetSingleton.sharedInstance.user.lastName
		profileImageView.image = LunchMeetSingleton.sharedInstance.user.profileImage
		
		firstNameLabel.sizeToFit()
		lastNameLabel.sizeToFit()
		profileImageView.backgroundColor = UIColor.clearColor()
		
		DepotSingleton.sharedDepot.getGroups { (response: [Group]) -> Void in
			dispatch_async(dispatch_get_main_queue(), { () -> Void in
				
				if response.count != 0 {
					self.groups = response
					
					self.groupCollectionView.reloadData()
				}
				
			})
			
		}
		
		groupCollectionView.registerNib(UINib(nibName: "GroupCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GroupCell")
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		title = "Me"
		tabBarItem.image = UIImage(named: "Image")
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	//MARK: UICollectionView
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return groups.count
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GroupCell", forIndexPath: indexPath) as! GroupCollectionViewCell
		
		cell.nameLabel.text = groups[indexPath.row].name
		cell.imageView.image = groups[indexPath.row].image
		
		return cell
	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		
	}
	
}

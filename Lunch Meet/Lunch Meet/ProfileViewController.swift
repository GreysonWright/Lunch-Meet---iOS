//
//  ProfileViewController.swift
//  Lunch Meet
//
//  Created by greyson on 4/30/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet var profileImageView: UIImageView!
	@IBOutlet var firstNameLabel: UILabel!
	@IBOutlet var lastNameLabel: UILabel!
	@IBOutlet var groupCollectionView: UICollectionView!
	@IBOutlet var friendTableView: UITableView!
	
	var loadingGroupLabel: UILabel!
	var friendLoadingLabel: UILabel!
	
	var groups: [Group] = [ ]
	var friends: [User] = [ ]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//Personal SetUp
		firstNameLabel.text = LunchMeetSingleton.sharedInstance.user.firstName
		lastNameLabel.text = LunchMeetSingleton.sharedInstance.user.lastName
		profileImageView.image = LunchMeetSingleton.sharedInstance.user.profileImage
		
		firstNameLabel.sizeToFit()
		lastNameLabel.sizeToFit()
		profileImageView.backgroundColor = UIColor.clearColor()
		
		//Groups
		loadingGroupLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 30))
		loadingGroupLabel.text = "Loading groups..."
		loadingGroupLabel.sizeToFit()
		groupCollectionView.addSubview(loadingGroupLabel)
		
		loadingGroupLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		groupCollectionView.addConstraint(NSLayoutConstraint(item: loadingGroupLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: groupCollectionView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		groupCollectionView.addConstraint(NSLayoutConstraint(item: loadingGroupLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: groupCollectionView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		
		groupCollectionView.layer.borderColor = UIColor.blackColor().CGColor
		groupCollectionView.layer.borderWidth = 0.5
		
		groupCollectionView.registerNib(UINib(nibName: "GroupCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GroupCell")
		
		//Friends
		friendLoadingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
		friendLoadingLabel.text = "Loading friends..."
		friendLoadingLabel.sizeToFit()
		friendTableView.addSubview(friendLoadingLabel)
		
		friendLoadingLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		friendTableView.addConstraint(NSLayoutConstraint(item: friendLoadingLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: friendTableView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		friendTableView.addConstraint(NSLayoutConstraint(item: friendLoadingLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: friendTableView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
			
		friendTableView.registerNib(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendCell")
		
		loadGroups()
		loadFriends()
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
	
	func loadGroups(){
		DepotSingleton.sharedDepot.getGroups({ (response: [Group]) -> Void in
			dispatch_async(dispatch_get_main_queue(), { () -> Void in
				if response.count != 0 {
					self.groups = response
					self.loadingGroupLabel.removeFromSuperview()
				} else {
					self.loadingGroupLabel.text = "You aren't in any groups"
					self.loadingGroupLabel.sizeToFit()
					self.loadingGroupLabel.center = self.groupCollectionView.center
				}
				self.groupCollectionView.reloadData()
			})
		})
	}
	
	func loadFriends(){
		DepotSingleton.sharedDepot.getFriends { (response: [User]) -> Void in
			dispatch_async(dispatch_get_main_queue(), { () -> Void in
				if response.count != 0{
					self.friends = response
					self.friendLoadingLabel.removeFromSuperview()
				} else {
					self.friendLoadingLabel.text = "You don't have any friends."
					self.friendLoadingLabel.sizeToFit()
					self.friendLoadingLabel.center = self.groupCollectionView.center
				}
				self.friendTableView.reloadData()
			})
		}
	}
	
	//MARK: UICollectionView Methods
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
	
	//MARK: UITableView Methods
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return friends.count
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 72
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendTableViewCell
		
		cell.firstNameLabel.text = friends[indexPath.row].firstName
		cell.lastNameLabel.text = friends[indexPath.row].lastName
		cell.profileImageView.image = friends[indexPath.row].profileImage
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
}

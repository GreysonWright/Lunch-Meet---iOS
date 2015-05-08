//Copyright (c) 2012 The Board of Trustees of The University of Alabama
//All rights reserved.
//
//Redistribution and use in source and binary forms, with or without
//modification, are permitted provided that the following conditions
//are met:
//
//1. Redistributions of source code must retain the above copyright
//notice, this list of conditions and the following disclaimer.
//2. Redistributions in binary form must reproduce the above copyright
//notice, this list of conditions and the following disclaimer in the
//documentation and/or other materials provided with the distribution.
//3. Neither the name of the University nor the names of the contributors
//may be used to endorse or promote products derived from this software
//without specific prior written permission.
//
//THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
//THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
//INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
//HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
//STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
//OF THE POSSIBILITY OF SUCH DAMAGE.

import Foundation

private let _sharedInstance = TestData()

class TestData: NSObject, DepotInterface {
	
	//Singleton Access
	class var sharedInstance: TestData {
		return _sharedInstance
	}
	
	private override init() {
		super.init()
	}
	
	func login(request: LoginRequest, response: ((LoginResponse) -> Void)) {
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), { () -> Void in
			sleep(1)
			
			let user = User()
			user.id = 0
			user.firstName = "Dennis"
			user.lastName = "Ritchie"
			user.birthDate = NSDate()
			user.favoritePlace = "Olive Garden"
			user.city = "Silicon Valley"
			user.state = "California"
			user.profileImage = UIImage(named: "Image")
			
			let accessToken = AccessToken()
			accessToken.token = "039aduf339jdq23kjn"
			accessToken.expiration = NSDate()
			
			let loginResponse = LoginResponse()
			loginResponse.accessToken = accessToken
			loginResponse.user = user
			
			LunchMeetSingleton.sharedInstance.user = loginResponse.user
			LunchMeetSingleton.sharedInstance.accessToken = loginResponse.accessToken
			
			if LunchMeetSingleton.sharedInstance.user.profileImage == nil{
				//				LunchMeetSingleton.sharedInstance.user.profileImage = UIImage(named: "")
				//assign default image
			}
			
			response(loginResponse)
			
		})
	}
	
	func getFeed(response: ([FeedItem]) -> Void) {
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
			sleep(1)
			
			let feedItem0 = FeedItem()
			feedItem0.event = "Lunch"
			feedItem0.details = "Chick Fil-A"
			feedItem0.date = "5/20/2015"
			feedItem0.type = "event"
			
			let feedItem1 = FeedItem()
			feedItem1.event = "Friend Added"
			feedItem1.details = "John Doe"
			feedItem1.date = "2 days ago"
			feedItem1.type = "friend"
			
			let feedItem2 = FeedItem()
			feedItem2.event = "Joined Group"
			feedItem2.details = "Cool People"
			feedItem2.date = "1 day ago"
			feedItem2.type = "group"
			
			let feedObjects = [feedItem0, feedItem1, feedItem2]
			response(feedObjects)
		})
	}
	
	func getGroups(response: (([Group]) -> Void)) {
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
			sleep(1)
			
			let userID = LunchMeetSingleton.sharedInstance.user.id
			
			let group = Group()
			group.name = "Cool Poeple"
			group.image = UIImage(named: "Image")
			//			group.members =
			//			group.owner =
			
			let groupArray = [group]
			response(groupArray as [Group])
		})
	}
	
	func getFriends(response: (([User]) -> Void)) {
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
			sleep(1)
			
			let userID = LunchMeetSingleton.sharedInstance.user.id
			
			let friend = User()
			friend.id = 2
			friend.firstName = "John"
			friend.lastName = "Smith"
			friend.birthDate = NSDate()
			friend.favoritePlace = "Glory Bound"
			friend.city = "Tuscaloosa"
			friend.state = "Alabama"
			friend.profileImage = UIImage(named: "Image")
			
			let friends = [friend]
			response(friends as [User])
		})
	}
}

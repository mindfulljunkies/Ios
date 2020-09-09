

import Foundation
 


enum UserAttributes :String {
  
  case name = "name"
  case email = "email"
  case checkUser = "checkUser"
  case password = "password"
  case deviceId = "deviceId"
  case deviceType = "deviceType"
  case imgUrl = "imgUrl"
  case userName = "userName"
  case token = "token"
  case id = "id"
  case status = "status"
  case firstName = "firstName"
   case lastName = "lastName"
   case phone = "phone"
   case location = "location"
    case dob = "dob"
    case gender = "gender"
    case registrationId = "registrationId"
    case googleId = "googleId"
    case activationCode = "activationCode"
    case verifyCode = "verifyCode"
    case ageGroup = "ageGroup"
    case locationCoordinates = "locationCoordinates"
    case userId = "userId"
    case isFamily = "isFamily"
    case familyId = "familyId"
    case isSelected = "isSelected"
    case diabetes = "diabetes"
    case birthday = "birthday"
    case countryCode = "countryCode"
    case countryId = "countryId"
    case isProfileCompleted = "isProfileCompleted"
    case facebookId = "facebookId"
    case zipCodeId = "zipCodeId"
    case regionId = "regionId"
    case lgaId = "lgaId"
    case stateId = "stateId"
    case zipCode = "zipCode"
    case region = "region"
    case lga = "lga"
    case state = "state"
    case isDiabetes = "isDiabetes"
    case diabetesYears = "diabetesYears"
    case pressureYears = "pressureYears"
    case cholestrolYears = "cholestrolYears"
    case height = "height"
    case weight = "weight"
    case glucoseLevel = "glucoseLevel"
    case isPressure = "isPressure"
    case isCholestrol = "isCholestrol"
    case lastMeal = "lastMeal"
    case generalSituation = "generalSituation"
    case bloodGroup = "bloodGroup"
    case employeeId = "employeeId"
    case role = "role"
    case requestStatus = "requestStatus"


  
  static let getAll = [
    name,
    email,
    checkUser,
    password,
    deviceId,
    deviceType,
     imgUrl,
    userName,
    token,
    id,
    ageGroup,
    locationCoordinates,
    status,
    firstName,
    lastName,
    phone,
    location,
    dob,
    gender,
    registrationId,
    googleId,
    activationCode,
    verifyCode,
    userId,
    isFamily,
    familyId,
    isSelected,
    diabetes,
    birthday,
    countryCode,
    countryId,
    facebookId,
    zipCodeId,
    regionId,
    lgaId,
    stateId,
    zipCode,
    region,
    lga,
    state,
    isDiabetes,
    diabetesYears,
    pressureYears,
    cholestrolYears,
    height,
    weight,
    glucoseLevel,
    isPressure,
    isCholestrol,
    lastMeal,
    generalSituation,
    bloodGroup,
    employeeId,
    role
  ]
}


public class User {
	public var name : String?
	public var email : String?
	public var oldPassword : String?
    public var newPassword : String?
  public var password : String?
  public var checkUser : Bool?
	public var deviceId : String?
	public var deviceType : String?
	public var imgUrl : String?
	public var userName : String?
  public var token : String?
  public var id : Int?
  public var status : String?
    public var ageGroup : String?
    public var locationCoordinates : String?
    public var firstName : String?
    public var lastName : String?
    public var phone : String?
//    public var location : Location?
    public var dob : String?
    public var gender : String?
    public var registrationId : String?
    public var googleId : String?
    public var activationCode : String?
     public var verifyCode : String?
    public var userId : Int?
    public var isFamily : Bool?
    public var familyId : Int?
    public var isSelected : Bool?
    public var diabetes : String?
    public var birthday : String?
    public var countryCode : String?
    public var countryId : Int?
    public var facebookId : String?
    public var zipCodeId : String?
    public var lgaId : String?
    public var stateId : String?
    public var regionId : String?
    public var zipCode : String?
    public var lga : String?
    public var state : String?
    public var region : String?
    public var loginType : String?
    public var isDiabetes : Bool?
    public var diabetesYears : String?
    public var pressureYears : String?
    public var cholestrolYears : String?
    public var height : Int?
    public var weight : Int?
    public var glucoseLevel : String?
    public var isPressure : Bool?
    public var isCholestrol : Bool?
    public var lastMeal : String?
    public var generalSituation : String?
    public var bloodGroup : String?
    public var employeeId : Int?
    public var role : String?
    public var profileStatus : String?
    public var requestStatus : String?
    public var facebookLink : String?
    public var instagramLink : String?
    public var twitterLink : String?

    



/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of User Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [User]
    {
        var models:[User] = []
        for item in array
        {
            models.append(User(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let User = User(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: User Instance.
*/
	required public init?(dictionary: NSDictionary) {

		name = dictionary["name"] as? String
		email = dictionary["email"] as? String
		oldPassword = dictionary["oldPassword"] as? String
        newPassword = dictionary["newPassword"] as? String
		deviceId = dictionary["deviceId"] as? String
		deviceType = dictionary["deviceType"] as? String
		 imgUrl = dictionary["imgUrl"] as? String
    password = dictionary["password"] as? String
		userName = dictionary["userName"] as? String
    status = dictionary["status"] as? String
        ageGroup = dictionary["ageGroup"] as? String
        locationCoordinates = dictionary["locationCoordinates"] as? String
    token = dictionary["token"] as? String
    id = dictionary["id"] as? Int
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        phone = dictionary["phone"] as? String
//    if (dictionary["location"] != nil) { location = Location(dictionary: dictionary["location"] as! NSDictionary) }
        dob = dictionary["dob"] as? String
        gender = dictionary["gender"] as? String
        registrationId = dictionary["registrationId"] as? String
        googleId = dictionary["googleId"] as? String
        activationCode = dictionary["activationCode"] as? String
        verifyCode = dictionary["verifyCode"] as? String
        diabetes = dictionary["diabetes"] as? String
        userId = dictionary["userId"] as? Int
        isFamily = dictionary["isFamily"] as? Bool
        familyId = dictionary["familyId"] as? Int
        isSelected = dictionary["isSelected"] as? Bool
        checkUser = dictionary["checkUser"] as? Bool
        birthday = dictionary["birthday"] as? String
        countryCode = dictionary["countryCode"] as? String
        countryId = dictionary["countryId"] as? Int
         facebookId = dictionary["facebookId"] as? String
        zipCodeId = dictionary["zipCodeId"] as? String
        lgaId = dictionary["lgaId"] as? String
        regionId = dictionary["regionId"] as? String
        stateId = dictionary["stateId"] as? String
        zipCode = dictionary["zipCode"] as? String
        lga = dictionary["lga"] as? String
        region = dictionary["region"] as? String
        isDiabetes = dictionary["isDiabetes"] as? Bool
        diabetesYears = dictionary["diabetesYears"] as? String
        pressureYears = dictionary["pressureYears"] as? String
        height = dictionary["height"] as? Int
        cholestrolYears = dictionary["cholestrolYears"] as? String
        weight = dictionary["weight"] as? Int
         glucoseLevel = dictionary["glucoseLevel"] as? String
         isPressure = dictionary["isPressure"] as? Bool
         isCholestrol = dictionary["isCholestrol"] as? Bool
         lastMeal = dictionary["lastMeal"] as? String
         generalSituation = dictionary["generalSituation"] as? String
        bloodGroup = dictionary["bloodGroup"] as? String
        role = dictionary["role"] as? String
        employeeId = dictionary["employeeId"] as? Int
        profileStatus = dictionary["profileStatus"] as? String
        requestStatus = dictionary["requestStatus"] as? String
        facebookLink = dictionary["facebookLink"] as? String
        instagramLink = dictionary["instagramLink"] as? String
        twitterLink = dictionary["twitterLink"] as? String

	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.oldPassword, forKey: "oldPassword")
        dictionary.setValue(self.newPassword, forKey: "newPassword")
    dictionary.setValue(self.password, forKey: "password")
		dictionary.setValue(self.deviceId, forKey: "deviceId")
		dictionary.setValue(self.deviceType, forKey: "deviceType")
		dictionary.setValue(self.imgUrl, forKey: "imgUrl")
		dictionary.setValue(self.userName, forKey: "userName")
    dictionary.setValue(self.status, forKey: "status")
         dictionary.setValue(self.ageGroup, forKey: "ageGroup")
         dictionary.setValue(self.locationCoordinates, forKey: "locationCoordinates")
    dictionary.setValue(self.id, forKey: "id")
    dictionary.setValue(self.token, forKey: "token")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        dictionary.setValue(self.phone, forKey: "phone")
//          dictionary.setValue(self.location?.dictionaryRepresentation(), forKey: "location")
        dictionary.setValue(self.dob, forKey: "dob")
        dictionary.setValue(self.gender, forKey: "gender")
        dictionary.setValue(self.registrationId, forKey: "registrationId")
        dictionary.setValue(self.googleId, forKey: "googleId")
        dictionary.setValue(self.activationCode, forKey: "activationCode")
        dictionary.setValue(self.verifyCode, forKey: "verifyCode")
        dictionary.setValue(self.userId, forKey: "userId")
        dictionary.setValue(self.isFamily, forKey: "isFamily")
        dictionary.setValue(self.familyId, forKey: "familyId")
        dictionary.setValue(self.isSelected, forKey: "isSelected")
        dictionary.setValue(self.birthday, forKey: "birthday")
        dictionary.setValue(self.countryCode, forKey: "countryCode")
        dictionary.setValue(self.countryId, forKey: "countryId")
        dictionary.setValue(self.facebookId, forKey: "facebookId")
        dictionary.setValue(self.zipCodeId, forKey: "zipCodeId")
        dictionary.setValue(self.checkUser, forKey: "checkUser")
        dictionary.setValue(self.lgaId, forKey: "lgaId")
        dictionary.setValue(self.stateId, forKey: "stateId")
        dictionary.setValue(self.regionId, forKey: "regionId")
        dictionary.setValue(self.zipCode, forKey: "zipCode")
        dictionary.setValue(self.lga, forKey: "lga")
        dictionary.setValue(self.state, forKey: "state")
        dictionary.setValue(self.region, forKey: "region")
        dictionary.setValue(self.loginType, forKey: "loginType")
        dictionary.setValue(self.bloodGroup, forKey: "bloodGroup")
        dictionary.setValue(self.employeeId, forKey: "employeeId")
        dictionary.setValue(self.role, forKey: "role")
        dictionary.setValue(self.profileStatus, forKey: "profileStatus")
        dictionary.setValue(self.requestStatus, forKey: "requestStatus")
        dictionary.setValue(self.facebookLink, forKey: "facebookLink")
        dictionary.setValue(self.instagramLink, forKey: "instagramLink")
        dictionary.setValue(self.twitterLink, forKey: "twitterLink")

		return dictionary
	}

}

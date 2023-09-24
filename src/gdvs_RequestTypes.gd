extends Node

var APIStateRequest = "APIStateRequest"
var AuthenticationTokenRequest = "AuthenticationTokenRequest"
var AuthenticationRequest = "AuthenticationRequest"
var VTSFolderInfoRequest = "VTSFolderInfoRequest"
var CurrentModelRequest = "CurrentModelRequest"
var AvailableModelsRequest = "AvailableModelsRequest"
var ModelLoadRequest = "ModelLoadRequest"
var MoveModelRequest = "MoveModelRequest"
var HotkeysInCurrentModelRequest = "HotkeysInCurrentModelRequest"
var HotkeyTriggerRequest = "HotkeyTriggerRequest"
var ExpressionStateRequest = "ExpressionStateRequest"
var ExpressionActivationRequest = "ExpressionActivationRequest"
var ArtMeshListRequest = "ArtMeshListRequest"
var ColorTintRequest = "ColorTintRequest"
var SceneColorOverlayInfoRequest = "SceneColorOverlayInfoRequest"
var FaceFoundRequest = "FaceFoundRequest"
var InputParameterListRequest = "InputParameterListRequest"
var ParameterValueRequest = "ParameterValueRequest"
var Live2DParameterListRequest = "Live2DParameterListRequest"
var ParameterCreationRequest = "ParameterCreationRequest"
var ParameterDeletionRequest = "ParameterDeletionRequest"
var InjectParameterDataRequest = "InjectParameterDataRequest"
var GetCurrentModelPhysicsRequest = "GetCurrentModelPhysicsRequest"
var SetCurrentModelPhysicsRequest = "SetCurrentModelPhysicsRequest"
var NDIConfigRequest = "NDIConfigRequest"
var ItemListRequest = "ItemListRequest"
var ItemLoadRequest = "ItemLoadRequest"
var ItemUnloadRequest = "ItemUnloadRequest"
var ItemAnimationControlRequest = "ItemAnimationControlRequest"
var ItemMoveRequest = "ItemMoveRequest"
var ArtMeshSelectionRequest = "ArtMeshSelectionRequest"
var VTubeStudioAPIStateBroadcast = "VTubeStudioAPIStateBroadcast"


var AuthenticationRequestArguments: Dictionary: 
	get: 
		return {
			"authenticationToken": "adcd-123-ef09-some-token-string-abcd"
		}
var ModelLoadRequestArguments: Dictionary: 
	get: 
		return {
			"modelID": "UniqueIDOfModelToLoad"
		}
var MoveModelRequestArguments: Dictionary: 
	get: 
		return {
		"timeInSeconds": 0.2,
		"valuesAreRelativeToModel": false,
		"positionX": 0.1,
		"positionY": -0.7,
		"rotation": 16.3,
		"size": -22.5
	}
var HotkeysInCurrentModelRequestArguments: Dictionary: 
	get: 
		return {
		"modelID": "Optional_UniqueIDOfModel",
		"live2DItemFileName": "Optional_Live2DItemFileName"
	}
var HotkeyTriggerRequestArguments: Dictionary: 
	get: 
		return {
		"hotkeyID": "HotkeyNameOrUniqueIdOfHotkeyToExecute",
		"itemInstanceID": "Optional_ItemInstanceIdOfLive2DItemToTriggerThisHotkeyFor"
	}
var ExpressionStateRequestArguments: Dictionary: 
	get: 
		return {
		"details": true,
		"expressionFile": "myExpression_optional_1.exp3.json",
	}
var ExpressionActivationRequestArguments: Dictionary: 
	get: 
		return {
		"expressionFile": "myExpression_1.exp3.json",
		"active": true
	}
var ColorTintRequestArguments: Dictionary: 
	get: 
		return {
		"colorTint": {
			"colorR": 255,
			"colorG": 150,
			"colorB": 0,
			"colorA": 255,
			"mixWithSceneLightingColor": 1
		},
		"artMeshMatcher": {
			"tintAll": false,
			"artMeshNumber": [1, 3, 5],
			"nameExact": ["eye_white_left", "eye_white_right"],
			"nameContains": ["mouth"],
			"tagExact": [],
			"tagContains": ["MyTag"]
		}
	}
var ParameterValueRequestArguments: Dictionary: 
	get: 
		return {
		"name": "MyCustomParamName1"
	}
var ParameterCreationRequestArguments: Dictionary: 
	get: 
		return {
		"parameterName": "MyNewParamName",
		"explanation": "This is my new parameter.",
		"min": -50,
		"max": 50,
		"defaultValue": 10
	}
var ParameterDeletionRequestArguments: Dictionary: 
	get: 
		return {
		"parameterName": "MyNewParamName"
	}
var InjectParameterDataRequestArguments: Dictionary: 
	get: 
		return {
		"faceFound": false,
		"mode": "set",
		"parameterValues": [
			{
				"id": "FaceAngleX",
				"value": 12.31
			},
			{
				"id": "MyNewParamName",
				"weight": 0.8,
				"value": 0.7
			}
		]
	}
var SetCurrentModelPhysicsRequestArguments: Dictionary: 
	get: 
		return {
		"strengthOverrides": [
			{
				"id": "PhysicsSetting1",
				"value": 1.5,
				"setBaseValue": false,
				"overrideSeconds": 2
			}
		],
		"windOverrides": [
			{
				"id": "",
				"value": 85,
				"setBaseValue": true,
				"overrideSeconds": 5
			}
		]
	}
var NDIConfigRequestArguments: Dictionary: 
	get: 
		return {
		"setNewConfig": true,
		"ndiActive": true,
		"useNDI5": true,
		"useCustomResolution": true,
		"customWidthNDI": 1024,
		"customHeightNDI": 512
	}
var ItemListRequestArguments: Dictionary: 
	get: 
		return {
		"includeAvailableSpots": true,
		"includeItemInstancesInScene": true,
		"includeAvailableItemFiles": false,
		"onlyItemsWithFileName": "OPTIONAL_my_item_filename.png",
		"onlyItemsWithInstanceID": "OPTIONAL_InstanceIdOfItemInScene"
	}
var ItemLoadRequestArguments: Dictionary: 
	get: 
		return {
		"fileName": "some_item_name.jpg",
		"positionX": 0,
		"positionY": 0.5,
		"size": 0.33,
		"rotation": 90,
		"fadeTime": 0.5,
		"order": 4,
		"failIfOrderTaken": false,
		"smoothing": 0,
		"censored": false,
		"flipped": false,
		"locked": false,
		"unloadWhenPluginDisconnects": true
	}
var ItemUnloadRequestArguments: Dictionary: 
	get: 
		return {
		"unloadAllInScene": false,
		"unloadAllLoadedByThisPlugin": false,
		"allowUnloadingItemsLoadedByUserOrOtherPlugins": true,
		"instanceIDs":
		[
			"SomeInstanceIdOfItemToUnload", "SomeOtherInstanceIdOfItemToUnload"
		],
		"fileNames":
		[
			"UnloadAllItemInstancesWithThisFileName", "SomeOtherFileName"
		]
	}
var ItemAnimationControlRequestArguments: Dictionary: 
	get: 
		return {
		"itemInstanceID": "ItemInstanceId",
		"framerate": 12,
		"frame": 3,
		"brightness": 1,
		"opacity": 1,
		"setAutoStopFrames": true,
		"autoStopFrames": [0, 7, 26],
		"setAnimationPlayState": true,
		"animationPlayState": true
	}
var ItemMoveRequestArguments: Dictionary: 
	get: 
		return {
		"itemsToMove":
		[
			{
				"itemInstanceID": "ItemInstanceId",
				"timeInSeconds": 1,
				"fadeMode": "easeOut",
				"positionX": 0.2,
				"positionY": -0.8,
				"size": 0.6,
				"rotation": 180,
				"order": -1000,
				"setFlip": true,
				"flip": false,
				"userCanStop": true
			},
			{
				"itemInstanceID": "SomeOther_ItemInstanceId",
				"timeInSeconds": 0.5,
				"fadeMode": "zip",
				"positionX": 1,
				"positionY": 1,
				"size": 0.3,
				"rotation": 0,
				"order": 25,
				"setFlip": false,
				"flip": false,
				"userCanStop": false
			}
		]
	}
var ArtMeshSelectionRequestArguments: Dictionary: 
	get: 
		return {
		"textOverride": "This text is shown over the ArtMesh selection list.",
		"helpOverride": "This text is shown when the user presses the ? button.",
		"requestedArtMeshCount": 5,
		"activeArtMeshes": [
			"D_BODY_00",
			"D_ARM_R_05"
		]
	}

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
			"authenticationToken": null
		}
var ModelLoadRequestArguments: Dictionary: 
	get: 
		return {
			"modelID": null
		}
var MoveModelRequestArguments: Dictionary: 
	get: 
		return {
		"timeInSeconds": null,
		"valuesAreRelativeToModel": null,
		"positionX": null,
		"positionY": null,
		"rotation": null,
		"size": null
	}
var HotkeysInCurrentModelRequestArguments: Dictionary: 
	get: 
		return {
		"modelID": null,
		"live2DItemFileName": null
	}
var HotkeyTriggerRequestArguments: Dictionary: 
	get: 
		return {
		"hotkeyID": null,
		"itemInstanceID": null
	}
var ExpressionStateRequestArguments: Dictionary: 
	get: 
		return {
		"details": null,
		"expressionFile": null
	}
var ExpressionActivationRequestArguments: Dictionary: 
	get: 
		return {
		"expressionFile": null,
		"active": null
	}
var ColorTintRequestArguments: Dictionary: 
	get: 
		return {
		"colorTint": {
			"colorR": null,
			"colorG": null,
			"colorB": null,
			"colorA": null,
			"mixWithSceneLightingColor": null
		},
		"artMeshMatcher": {
			"tintAll": null,
			"artMeshNumber": null,
			"nameExact": null,
			"nameContains": null,
			"tagExact": null,
			"tagContains": null
		}
	}
var ParameterValueRequestArguments: Dictionary: 
	get: 
		return {
		"name": null
	}
var ParameterCreationRequestArguments: Dictionary: 
	get: 
		return {
		"parameterName": null,
		"explanation": null,
		"min": null,
		"max": null,
		"defaultValue": null
	}
var ParameterDeletionRequestArguments: Dictionary: 
	get: 
		return {
		"parameterName": null
	}
var InjectParameterDataRequestArguments: Dictionary: 
	get: 
		return {
		"faceFound": null,
		"mode": null,
		"parameterValues": [
			{
				"id": null,
				"value": null
			},
			{
				"id": null,
				"weight": null,
				"value": null
			}
		]
	}
var SetCurrentModelPhysicsRequestArguments: Dictionary: 
	get: 
		return {
		"strengthOverrides": [
			{
				"id": null,
				"value": null,
				"setBaseValue": null,
				"overrideSeconds": null
			}
		],
		"windOverrides": [
			{
				"id": null,
				"value": null,
				"setBaseValue": null,
				"overrideSeconds": null
			}
		]
	}
var NDIConfigRequestArguments: Dictionary: 
	get: 
		return {
		"setNewConfig": null,
		"ndiActive": null,
		"useNDI5": null,
		"useCustomResolution": null,
		"customWidthNDI": null,
		"customHeightNDI": null
	}
var ItemListRequestArguments: Dictionary: 
	get: 
		return {
		"includeAvailableSpots": null,
		"includeItemInstancesInScene": null,
		"includeAvailableItemFiles": null,
		"onlyItemsWithFileName": null,
		"onlyItemsWithInstanceID": null
	}
var ItemLoadRequestArguments: Dictionary: 
	get: 
		return {
		"fileName": null,
		"positionX": null,
		"positionY": null,
		"size": null,
		"rotation": null,
		"fadeTime": null,
		"order": null,
		"failIfOrderTaken": null,
		"smoothing": null,
		"censored": null,
		"flipped": null,
		"locked": null,
		"unloadWhenPluginDisconnects": null
	}
var ItemUnloadRequestArguments: Dictionary: 
	get: 
		return {
		"unloadAllInScene": null,
		"unloadAllLoadedByThisPlugin": null,
		"allowUnloadingItemsLoadedByUserOrOtherPlugins": null,
		"instanceIDs": null, #Array
		"fileNames": null
#		[
#			"UnloadAllItemInstancesWithThisFileName", "SomeOtherFileName"
#		]
	}
var ItemAnimationControlRequestArguments: Dictionary: 
	get: 
		return {
		"itemInstanceID": null,
		"framerate": null,
		"frame": null,
		"brightness": null,
		"opacity": null,
		"setAutoStopFrames": null,
		"autoStopFrames": null, #Array
		"setAnimationPlayState": null,
		"animationPlayState": null
	}
var ItemMoveRequestArguments: Dictionary: 
	get: 
		return {
		"itemsToMove": null
#		[
#			{
#				"itemInstanceID": "ItemInstanceId",
#				"timeInSeconds": 1,
#				"fadeMode": "easeOut",
#				"positionX": 0.2,
#				"positionY": -0.8,
#				"size": 0.6,
#				"rotation": 180,
#				"order": -1000,
#				"setFlip": true,
#				"flip": false,
#				"userCanStop": true
#			},
#			{
#				"itemInstanceID": "SomeOther_ItemInstanceId",
#				"timeInSeconds": 0.5,
#				"fadeMode": "zip",
#				"positionX": 1,
#				"positionY": 1,
#				"size": 0.3,
#				"rotation": 0,
#				"order": 25,
#				"setFlip": false,
#				"flip": false,
#				"userCanStop": false
#			}
#		]
	}
var ArtMeshSelectionRequestArguments: Dictionary: 
	get: 
		return {
		"textOverride": null,
		"helpOverride": null,
		"requestedArtMeshCount": null,
		"activeArtMeshes": null
#		[
#			"D_BODY_00",
#			"D_ARM_R_05"
#		]
	}

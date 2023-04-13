{
	"contents": {
		"6e711891-2abd-46c8-8545-126403969081": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "bsx.createuserworkflowbtp",
			"subject": "Create User: External Workflow Step on BTP",
			"businessKey": "",
			"name": "createuserworkflowbtp",
			"documentation": "Step to create users in subaccout",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"fa3a18b0-fb83-4e5d-9804-fc11617ccb64": {
					"name": "CreateUserTask"
				},
				"72483b55-6bd6-45b1-86d3-83233f14e907": {
					"name": "AssignRoleTask"
				},
				"04abb970-5e2c-4f17-99aa-c35ce0e7a314": {
					"name": "FormatUserInfoForRole"
				},
				"3b351c82-a599-4078-9dc9-c793ad60334c": {
					"name": "FormatUserInfoForIdpActivation"
				},
				"88a57253-7a62-4e3c-bc89-2ba09c6872ee": {
					"name": "ActivateUserInIdp"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"7e9054f1-52a8-4e80-8bc3-932ef5959063": {
					"name": "SequenceFlow2"
				},
				"74c2d110-b518-4621-8561-6134f014e8b7": {
					"name": "SequenceFlow8"
				},
				"a095beeb-9856-4aaf-ac34-9119a5841a59": {
					"name": "SequenceFlow9"
				},
				"7ccb5f3f-9699-4d91-95cc-1e3d4e1175fa": {
					"name": "SequenceFlow10"
				},
				"b2c89017-05e8-4dac-bdaf-5a525c29974a": {
					"name": "SequenceFlow11"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1",
			"eventDefinitions": {
				"1b17d66c-8d2b-4ced-9d57-c3fe639673a5": {}
			}
		},
		"fa3a18b0-fb83-4e5d-9804-fc11617ccb64": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "scim_shadow_users",
			"destinationSource": "consumer",
			"path": "Users",
			"httpMethod": "POST",
			"xsrfPath": "",
			"requestVariable": "${context.payload}",
			"responseVariable": "${context.createUser.response}",
			"headers": [{
				"name": "Content-Type",
				"value": "application/json"
			}],
			"id": "servicetask1",
			"name": "CreateUserTask"
		},
		"72483b55-6bd6-45b1-86d3-83233f14e907": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "scim_shadow_users",
			"destinationSource": "consumer",
			"path": "Groups/RF_Processing_Role",
			"httpMethod": "PATCH",
			"requestVariable": "${context.AssignRole.rolePayload}",
			"headers": [{
				"name": "If-Match",
				"value": "1"
			}],
			"id": "servicetask6",
			"name": "AssignRoleTask"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "fa3a18b0-fb83-4e5d-9804-fc11617ccb64"
		},
		"7e9054f1-52a8-4e80-8bc3-932ef5959063": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "fa3a18b0-fb83-4e5d-9804-fc11617ccb64",
			"targetRef": "04abb970-5e2c-4f17-99aa-c35ce0e7a314"
		},
		"74c2d110-b518-4621-8561-6134f014e8b7": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "72483b55-6bd6-45b1-86d3-83233f14e907",
			"targetRef": "3b351c82-a599-4078-9dc9-c793ad60334c"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"d1d3768a-7da5-4ab0-b64e-d6853fb06811": {},
				"a5b95cfb-5569-47ce-9f22-d996a6854f49": {},
				"ce494525-5052-4e3c-beaf-d72fc2e2a376": {},
				"c78d2dce-ae16-4aee-8ba3-b81ef2f1007e": {},
				"2cf5740f-6760-4ab2-b32c-5ea94a540240": {},
				"1201407c-5d68-4659-867e-42f0095f1889": {},
				"e0829aa3-0e00-4d83-9c98-216999a24573": {},
				"c88ab266-baed-426d-a47a-f60039350e23": {},
				"003cdcff-1575-4ec5-ab3d-443916c46104": {},
				"bc3c2678-f196-4d46-999e-0ed4da93ec27": {}
			}
		},
		"1b17d66c-8d2b-4ced-9d57-c3fe639673a5": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition1"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 35,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 740,
			"y": 251,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "51,119.375 174.24147286593848,119.375",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "d1d3768a-7da5-4ab0-b64e-d6853fb06811",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"d1d3768a-7da5-4ab0-b64e-d6853fb06811": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 124.24147286593848,
			"y": 92.75,
			"width": 100,
			"height": 60,
			"object": "fa3a18b0-fb83-4e5d-9804-fc11617ccb64"
		},
		"a5b95cfb-5569-47ce-9f22-d996a6854f49": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "174.24147286593848,122.71875 302.80610464945386,122.71875",
			"sourceSymbol": "d1d3768a-7da5-4ab0-b64e-d6853fb06811",
			"targetSymbol": "2cf5740f-6760-4ab2-b32c-5ea94a540240",
			"object": "7e9054f1-52a8-4e80-8bc3-932ef5959063"
		},
		"ce494525-5052-4e3c-beaf-d72fc2e2a376": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 382.37073643296924,
			"y": 92.625,
			"width": 100,
			"height": 60,
			"object": "72483b55-6bd6-45b1-86d3-83233f14e907"
		},
		"c78d2dce-ae16-4aee-8ba3-b81ef2f1007e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "432.37073643296924,122.59375 579.9353682164847,122.59375",
			"sourceSymbol": "ce494525-5052-4e3c-beaf-d72fc2e2a376",
			"targetSymbol": "e0829aa3-0e00-4d83-9c98-216999a24573",
			"object": "74c2d110-b518-4621-8561-6134f014e8b7"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 1,
			"sequenceflow": 11,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 7,
			"scripttask": 2
		},
		"04abb970-5e2c-4f17-99aa-c35ce0e7a314": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/FormatUserInfoForRole.js",
			"id": "scripttask1",
			"name": "FormatUserInfoForRole"
		},
		"2cf5740f-6760-4ab2-b32c-5ea94a540240": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 252.80610464945386,
			"y": 92.6875,
			"width": 100,
			"height": 60,
			"object": "04abb970-5e2c-4f17-99aa-c35ce0e7a314"
		},
		"a095beeb-9856-4aaf-ac34-9119a5841a59": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "04abb970-5e2c-4f17-99aa-c35ce0e7a314",
			"targetRef": "72483b55-6bd6-45b1-86d3-83233f14e907"
		},
		"1201407c-5d68-4659-867e-42f0095f1889": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "302.80610464945386,122.65625 432.37073643296924,122.65625",
			"sourceSymbol": "2cf5740f-6760-4ab2-b32c-5ea94a540240",
			"targetSymbol": "ce494525-5052-4e3c-beaf-d72fc2e2a376",
			"object": "a095beeb-9856-4aaf-ac34-9119a5841a59"
		},
		"3b351c82-a599-4078-9dc9-c793ad60334c": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/FormatUserInfoForIdpActivation.js",
			"id": "scripttask2",
			"name": "FormatUserInfoForIdpActivation"
		},
		"e0829aa3-0e00-4d83-9c98-216999a24573": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 529.9353682164847,
			"y": 92.5625,
			"width": 100,
			"height": 60,
			"object": "3b351c82-a599-4078-9dc9-c793ad60334c"
		},
		"7ccb5f3f-9699-4d91-95cc-1e3d4e1175fa": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "3b351c82-a599-4078-9dc9-c793ad60334c",
			"targetRef": "88a57253-7a62-4e3c-bc89-2ba09c6872ee"
		},
		"c88ab266-baed-426d-a47a-f60039350e23": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "579.9353682164847,125.046875 763.7176841082423,125.046875",
			"sourceSymbol": "e0829aa3-0e00-4d83-9c98-216999a24573",
			"targetSymbol": "003cdcff-1575-4ec5-ab3d-443916c46104",
			"object": "7ccb5f3f-9699-4d91-95cc-1e3d4e1175fa"
		},
		"88a57253-7a62-4e3c-bc89-2ba09c6872ee": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "cloud_identity_service",
			"destinationSource": "consumer",
			"path": "scim/Users/${context.IdpId}",
			"httpMethod": "PATCH",
			"requestVariable": "${context.ActivateIdp.activateIdpPayload}",
			"headers": [{
				"name": "Content-Type",
				"value": "application/scim+json"
			}],
			"id": "servicetask7",
			"name": "ActivateUserInIdp"
		},
		"003cdcff-1575-4ec5-ab3d-443916c46104": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 713.7176841082423,
			"y": 97.53125,
			"width": 100,
			"height": 60,
			"object": "88a57253-7a62-4e3c-bc89-2ba09c6872ee"
		},
		"b2c89017-05e8-4dac-bdaf-5a525c29974a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "88a57253-7a62-4e3c-bc89-2ba09c6872ee",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"bc3c2678-f196-4d46-999e-0ed4da93ec27": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "760.6088420541212,127.53125 760.6088420541212,268.5",
			"sourceSymbol": "003cdcff-1575-4ec5-ab3d-443916c46104",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "b2c89017-05e8-4dac-bdaf-5a525c29974a"
		}
	}
}
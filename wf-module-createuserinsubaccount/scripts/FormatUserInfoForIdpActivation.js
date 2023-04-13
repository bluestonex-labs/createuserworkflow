var sIdpId = $.context.IdpId;
$.context.ActivateIdp.activateIdpPayload = {
    "schemas": [
        "urn:ietf:params:scim:api:messages:2.0:PatchOp"
    ],
    "Operations": [
        {
            "op": "replace",
            "path": "active",
            "value": true
        }
    ]
}
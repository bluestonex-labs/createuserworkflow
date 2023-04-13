var sUserId = $.context.createUser.response.id;
/*$.context.AssignRole.rolePayload = {
    "id": "RF_Processing_Role",
    "members": [
        {
            "type": "USER",
            "value": sUserId,
            "operation": "update"
        }
    ]
} */

$.context.AssignRole.rolePayload.members = [
    {
        "type": "USER",
        "value": sUserId,
        "operation": "update"
    }
]
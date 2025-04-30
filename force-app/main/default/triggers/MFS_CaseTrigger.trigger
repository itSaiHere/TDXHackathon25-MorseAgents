trigger MFS_CaseTrigger on Case (before insert) {
	MFS_CaseTriggerHelper.handleBeforeInsert();
    
}
public class agent_analytics {
    
    
    @AuraEnabled
    public static string callAgent(string prompt){
       // try {
        Map<String, ConnectApi.WrappedValue> inputParams = new Map<String, ConnectApi.WrappedValue>();
        ConnectApi.WrappedValue bodyWrapper = new ConnectApi.WrappedValue();
        bodyWrapper.value = prompt;
        inputParams.put('Input:UserPrompt', bodyWrapper);

        // Configure invocation parameters
        ConnectApi.EinsteinPromptTemplateGenerationsInput executeTemplateInput = new ConnectApi.EinsteinPromptTemplateGenerationsInput();
        executeTemplateInput.additionalConfig = new ConnectApi.EinsteinLlmAdditionalConfigInput();
        executeTemplateInput.isPreview = false;
        executeTemplateInput.inputParams = inputParams;
		string text = '' ;
        try {
            // Call the service
            ConnectApi.EinsteinPromptTemplateGenerationsRepresentation generationsOutput = ConnectApi.EinsteinLLM.generateMessagesForPromptTemplate(
                'Mutual_Fund_Information_Dummy',
                executeTemplateInput
            );
            ConnectApi.EinsteinLLMGenerationItemOutput response = generationsOutput.generations[0];
            text = response.text;
        } catch (Exception e) {
        }
        
         return text;
            

    }

}
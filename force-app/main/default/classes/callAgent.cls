public with sharing class callAgent {

    @AuraEnabled
    public static map<string,string> callAgent(string prompt,string sessionId){
       // try {
            String agentApiName = 'Morse_Agent';
            String userMessage = prompt;
            Invocable.Action action = Invocable.Action.createCustomAction(
            'generateAiAgentResponse', // The name of the invocable action
            agentApiName
            );
            action.setInvocationParameter('userMessage', userMessage);
            if (sessionId != null) {
            // Add session id only if it exists
                action.setInvocationParameter('sessionId', sessionId);
            }
            List<Invocable.Action.Result> results = action.invoke();
            Invocable.Action.Result result = results[0];
            String agentResponse = (String) result.getOutputParameters().get('agentResponse');
            sessionId = (String) result.getOutputParameters().get('sessionId');
            return new map<string,string>{'agentResponse'=>agentResponse,
                						   'sessionId'=>sessionId};
            

    }
    
    
    
    
    
}
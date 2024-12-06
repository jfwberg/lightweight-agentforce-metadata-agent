/**
 * @author         Justus van den Berg (jfwberg@gmail.com)
 * @date           December 2024
 * @copyright      (c) 2024 Justus van den Berg
 * @license        MIT (See LICENSE file in the project root)
 * @description    Invocable class for agentforce that lists metadata
 * @note           This is for POC purposes only, NOT for production purposes
*/
public with sharing class CopilotMetadataLister {
    
	@InvocableMethod(label='Copilot Metadata Lister' description='Lists the metadata items based on the metadata type')
    public static List<Response> create(List<Request> requests) {
        
        List<Response> responses = new List<Response>();
        
        for(Request req :requests){
            Response response = listMetadata(req);
            responses.add(response);
        }
        
        return responses;
    }
    
    
    private static Response listMetadata(Request request) {
        Response response = new Response();
        
        try{
            soap.Wsdl lsAction = new soap.MdtWsdl('listMetadata')
                .addListMetadata(request.metadataType)                
            ;

            if(!Test.isRunningTest()){lsAction.call();}
            response.output = lsAction.getResponse().getBody();
            
        } catch(Exception e){
           response.output = e.getMessage();
        }
        
        return response;
    }


    public class Request {        
        @InvocableVariable(description='Value that defines the metadata type')
        public String metadataType;
    }
    

    public class Response {
        @InvocableVariable(description='List where each item represents a metadata item for the specified type')
        public String output;
    }  
}
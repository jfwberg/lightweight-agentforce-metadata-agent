/**
 * @author         Justus van den Berg (jfwberg@gmail.com)
 * @date           December 2024
 * @copyright      (c) 2024 Justus van den Berg
 * @license        MIT (See LICENSE file in the project root)
 * @description    Invocable class for agentforce that reads metadata
 * @note           This is for POC purposes only, NOT for production purposes
*/
public with sharing class CopilotMetadataReader {
    
	@InvocableMethod(label='Copilot Metadata Reader' description='Reads the metadata based on the metadata type and metadata item name')
    public static List<Response> create(List<Request> requests) {
        
        List<Response> responses = new List<Response>();
        
        for(Request req :requests){
            Response response = readMetadata(req);
            responses.add(response);
        }
        
        return responses;
    }
    

    private static Response readMetadata(Request request) {
        
        Response response = new Response();
        
        try{
            soap.Wsdl rdAction = new soap.MdtWsdl('readMetadata')
                .setItemMetadataType(request.metadataType)
                .addItemMetadataFullName(request.metadataFullName)
            ;

            if(!Test.isRunningTest()){rdAction.call();}
            response.output = rdAction.getResponse().getBody();
            
        } catch(Exception e){
           response.output = e.getMessage();
        }
        
        return response;
    }


    public class Request {
        
        @InvocableVariable(description='Value that defines the metadata type')
        public String metadataType;
        
        @InvocableVariable(description='The name or fullName of the metadata item')
        public String metadataFullName;
    }
    
    
    public class Response {
        @InvocableVariable(description='The XML that represents the metadata item returned from a read result')
        public String output;
    }  
}
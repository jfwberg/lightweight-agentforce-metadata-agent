/**
 * @author         Justus van den Berg (jfwberg@gmail.com)
 * @date           December 2024
 * @copyright      (c) 2024 Justus van den Berg
 * @license        MIT (See LICENSE file in the project root)
 * @description    Test class for 100% COVERAGE ONLY
 * @note           This is for POC purposes only, NOT for production purposes
*/
@IsTest
private class CopilotMetadataReaderTest {

    @IsTest
    private static void testListMetadata() {
        
        String output;

        CopilotMetadataReader.Request request = new CopilotMetadataReader.Request();
        request.metadataType     = 'CustomObject';
        request.metadataFullName = 'Account';

        Test.startTest();
        output = CopilotMetadataReader.create(new CopilotMetadataReader.Request[]{request})[0].output;
        Test.stopTest();

        Assert.areNotEqual(null, output);
    }
}
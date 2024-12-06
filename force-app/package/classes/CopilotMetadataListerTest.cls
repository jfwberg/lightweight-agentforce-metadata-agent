/**
 * @author         Justus van den Berg (jfwberg@gmail.com)
 * @date           December 2024
 * @copyright      (c) 2024 Justus van den Berg
 * @license        MIT (See LICENSE file in the project root)
 * @description    Test class for 100% COVERAGE ONLY
 * @note           This is for POC purposes only, NOT for production purposes
*/
@IsTest
private class CopilotMetadataListerTest {

    @IsTest
    private static void testListMetadata() {

        String output;

        CopilotMetadataLister.Request request = new CopilotMetadataLister.Request();
        request.metadataType = 'CustomObject';

        Test.startTest();
        output = CopilotMetadataLister.create(new CopilotMetadataLister.Request[]{request})[0].output;
        Test.stopTest();

        Assert.areNotEqual(null, output);
    }
}
public class CalloutClass {
	@future(callout = true) 
    public static void makeCallout() {
        HttpRequest request = new HttpRequest();
        String endpoint = 'http://yourHost/yourService';
        request.setEndpoint(endpoint);
        request.setEndpoint('GET');
        HttpResponse response = new HTTP().send(request);
    }
}
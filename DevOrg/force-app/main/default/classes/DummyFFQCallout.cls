public class DummyFFQCallout {
    
    public static void dummyFFQResposne(){
        //string reqBody = FFQNotFoundController.genPayload('praveentest123@gmail.com', null, 'Praveen', '43110', '2024/04/02', true);
		Http http = new Http();
        HTTPRequest dummyRequest = new HTTPRequest();   
      //string dummyFfqNotFoundUrl = 'http://fewvpmlr1124:9191/DTAFT/dtprospectms/v2/quotes?operation=searchFFQQuotesByCriteria';
        string dummyFfqNotFoundUrl = 'https://fewvpmlr1124:9192/DTAFT/dtprospectms/v2/quotes?operation=searchFFQQuotesByCriteria';
        //dummyRequest = CommonUtil.generateHttpRequestForFFQNotFound(dummyFfqNotFoundUrl,'6633304299', reqBody);
        dummyRequest.setEndpoint(dummyFfqNotFoundUrl);
        dummyRequest.setMethod('POST');
        //dummyRequest.setTimeout(20000);
        HttpResponse res = http.send(dummyRequest);       
        if(res.getStatusCode() == 200){     
            system.debug('Success==>>'+res.getStatusCode());
    }
  }
}
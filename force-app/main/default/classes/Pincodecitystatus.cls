public class Pincodecitystatus {

    @invocablemethod(label = 'hurree')
    public static list<string> getcity(list<integer> pincode)
    {
        //https://api.zipcodestack.com/v1/search?
        //apikey=zip_live_yGPovRvPobXWJadoronP35yE3PQmjA8QdUqFGmrc&codes=400097&country=null
        http h = new http();
        httprequest hreq = new httprequest();
        string endpoint = 'https://api.zipcodestack.com/v1/search?';
        endpoint = endpoint + 'codes='+pincode[0] + '&country=IN';
        system.debug(endpoint);
        hreq.setHeader('apikey', 'zip_live_yGPovRvPobXWJadoronP35yE3PQmjA8QdUqFGmrc');
        hreq.setEndpoint(endpoint);
        hreq.setMethod('GET');
        httpresponse hres =  h.send(hreq);
        system.debug('response' +hres.getBody());
        
       
Map<string,object> mm = (Map<String, Object>)JSON.deserializeUntyped(hres.getBody());
Map<string,object> nn = (Map<string,object>)mm.get('results');
List<object> oo = (list<object>)nn.get('400097');
 Map<string,object> kk = (map<string,object>)oo[0];
        string city = (string)kk.get('city');
system.debug(city);
        return new list<string>{city};   
    }
}
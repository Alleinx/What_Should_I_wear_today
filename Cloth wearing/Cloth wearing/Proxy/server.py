# Need to launch server first
from xmlrpc.server import SimpleXMLRPCServer
from xmlrpc.server import SimpleXMLRPCRequestHandler
import requests
import json
import datetime

class RequestHandler(SimpleXMLRPCRequestHandler):
    rpc_path = ('/RPC', )

with SimpleXMLRPCServer(('localhost', 8000), requestHandler = RequestHandler) as server:
    
    print('Server waiting...')
    server.register_introspection_functions()
    
    #Function Define Below:
    def add_function(x, y):
        return x + y

    def get_average_temp():
        r = requests.get('https://www.tianqiapi.com/api/?version=v1&cityid=101280701')
        r.encoding = 'utf-8'
        dt = datetime.datetime.now()
        
        parsed_json = json.loads(r.text)
        weather = []


        for i in range(len(parsed_json['data'])):
            for j in range(len(parsed_json['data'][i]['hours'])):
                if (parsed_json['data'][i]['hours'][j]['day'][:2] == str(dt.day)):
                    weather.append(int(parsed_json['data'][i]['hours'][j]['tem'][:2]))
        
        return sum(weather)/len(weather)
    
    def getWearingResult(cloth_num, temperature, data):
        print(cloth_num)
        print(temperature)
        print(data)
        return temperature
    
    server.register_function(add_function, 'add')
    server.register_function(get_average_temp, 'get_average_temp')
    server.register_function(getWearingResult, 'getWearingResult')
    
    server.serve_forever()

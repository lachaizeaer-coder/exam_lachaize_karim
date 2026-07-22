import os
import requests
import sys


#### API adress
api_address = 'localhost'
#### API port
api_port = 8000

#### Vars
version = sys.argv[0]
username = "alice"
password = "wonderland"
sentences = ["life is beautiful", "that sucks"]
results = []

#### Requests
for s in sentences:
    r = requests.get(
        url='http://{address}:{port}/v{version}/sentiment'.format(address=api_address, port=api_port, version=version),
        params= {
            'username': username,
            'password': password,
            'sentence': s
        }
    )
    score = r.json()["score"]
    result = 1 if abs(score)==score else -1
    results.append(result)


output = '''
============================
   Sentiment Analysis test
============================

request done at "/v{version}/sentiment"
| username = {username}
| password = {password}
|
| sentence = {sentence}


sentiment analysis restult = {status_code}

==>  {test_result}

'''



#### Request result
test_status = []
test_result = 
i=0
while i<len(score):
    if score[i] == 1:
        status = 'POSITIVE'
    else:
        status = 'NEGATIVE'
    test_status.append(status)
    i+=1
if test_status[0]== 1 and test_status[1]==-1:
    test_result = 'TEST SUCCESSFUL'

print(output.format(username=username, password=password,sentence=sentences, status_code=status_code, test_status=test_status, version=version, test_result=test_result))

#### Write to log file
if os.environ.get('LOG') == 1:
    with open('api_test.log', 'a') as file:
        file.write(output)

import os
import requests

#### API adress
api_address = 'api'
#### API port
api_port = 8000

#### Runtime vars
username =  ['alice', 'bob']
password =  ['wonderland', 'builder']
sentence =  "This is a good test sentence!"

#### Request
for u in username:
    index = username.index(u)
    user = username[index]
    pwd = password[index]
    r1 = requests.get(
        url='http://{address}:{port}/v1/sentiment'.format(address=api_address, port=api_port),
        params= {
            'username': u,
            'password': pwd,
            'sentence': sentence
        }
    )

    r2 = requests.get(
        url='http://{address}:{port}/v2/sentiment'.format(address=api_address, port=api_port),
        params= {
            'username': u,
            'password': pwd,
            'sentence': sentence
        }
    )



    output = '''
    ============================
          Credential Test
    ============================

    request done at "/permissions"
    | username = {u}
    | password = {pwd}
    |
    | sentence = {sentence}

    expected result = 200

    actual result for SAn v1 = {status_code_v1}
    actual result for SAn v2 = {status_code_v2}

    ==> model v1: {test_status_v1}
    ==> model v2: {test_status_v2}
    '''


    #### Request status
    status_code_v1 = r1.status_code
    status_code_v2 = r2.status_code

    #### Request result for sentiment analysis v1
    if status_code_v1 == 200:
        test_status_v1 = 'SUCCESS'
    else:
        test_status_v1 = 'FAILURE'
    #-
    if status_code_v2 == 200:
        test_status_v2 = 'SUCCESS'
    else:
        test_status_v2 = 'FAILURE'

    print(output.format(
        u=username,
        pwd=password,
        sentence=sentence,
        status_code_v1=status_code_v1,
        test_status_v1=test_status_v1,
        status_code_v2=status_code_v2,
        test_status_v2=test_status_v2))

    #### Write to log file
    if os.environ.get('LOG') == '1':
        with open('/home/logs/api_test.log', 'a') as file:
            file.write(output+"\n")
            file.flush()

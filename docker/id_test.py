import os
import requests
import sys


#### API adress
api_address = 'reverent_hodgkin'
#### API port
api_port = 8000

#### Runtime vars
username = ['alice', 'bob', 'clementine']
password = ['wonderland', 'builder', 'mandarine']

#### Request
for u in username:

    index = username.index(u)
    user = username[index]
    pwd = password[index]

    r = requests.get(
        url='http://{address}:{port}/permissions'.format(address=api_address, port=api_port),
        params= {
            'username': user,
            'password': pwd
        }
    )


    output = '''
    ============================
        Authentication Test
    ============================

    request done at "/permissions"
    | username = {user}
    | password = {pwd}

    expected result = 200
    actual restult = {status_code}

    ==>  {test_status}

    '''


    #### Request status
    status_code = r.status_code

    #### Request result
    if status_code == 200:
        test_status = 'SUCCESS'
    else:
        test_status = 'FAILURE'
    print(output.format(user=user, pwd=pwd, status_code=status_code, test_status=test_status))
    
    #### Write to log file
    if os.environ.get('LOG') == 1:
        with open('api_test.log', 'a') as file:
            file.write(output)

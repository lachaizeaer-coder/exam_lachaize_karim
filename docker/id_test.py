import os
import requests
import sys


#### API adress
api_address = '0.0.0.0'
#### API port
api_port = 8000

#### Runtime vars
username = sys.argv[1]
password = sys.argv[2]

#### Request
r = requests.get(
    url='http://{address}:{port}/permissions'.format(address=api_address, port=api_port),
    params= {
        'username': username,
        'password': password
    }
)


output = '''
============================
    Authentication Test
============================

request done at "/permissions"
| username = {username}
| password = {password}

expected result = 200
actual restult = {status_code}

==>  {test_status}

'''


# Request status
status_code = r.status_code

# Request result
if status_code == 200:
    test_status = 'SUCCESS'
else:
    test_status = 'FAILURE'
print(output.format(username=sys.argv[1],password=sys.argv[2],status_code=status_code, test_status=test_status))

# Write to log file
if os.environ.get('LOG') == 1:
    with open('api_test.log', 'a') as file:
        file.write(output)


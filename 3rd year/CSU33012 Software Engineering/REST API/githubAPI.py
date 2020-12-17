#https://www.thepythoncode.com/article/using-github-api-in-python
#pip3 install PyGithub requests
import base64
from github import Github
from pprint import pprint

import requests
from pprint import pprint

#get github username and token
username = input("Enter the github username:")
token = input("Enter the access token:")

#url to request
response = requests.get('https://api.github.com/user/repos',auth=(username, token) )

# url to request
url = f"https://api.github.com/users/{username}"

# make the request and return the json
user_data = requests.get(url).json()

# pretty print JSON data
pprint(user_data)

for repo in username.get_repos():
    print(repo)
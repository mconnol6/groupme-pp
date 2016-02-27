import requests

url = 'http://groupme-pp.herokuapp.com/'
s = requests.Session()
msg = 'meh'
print s.post(url + 'login', {"username": "maryconnoli"})
s.post(url + 'new_message', {"username": "maryconnoli", "message": msg})
r = s.get(url + 'get_all_messages')
print r.content

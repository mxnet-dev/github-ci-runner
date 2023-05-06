import os
import requests
from bs4 import BeautifulSoup

URL = 'https://releases.ubuntu.com/22.04/'

response = requests.get(URL)
soup = BeautifulSoup(response.content, 'html.parser')

iso_links = [link.get('href') for link in soup.find_all('a') if link.get('href', '').startswith('ubuntu-22.04.') and link.get('href', '').endswith('-live-server-amd64.iso')]

latest_iso_url = URL + sorted(iso_links)[-1]

with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'latest_iso_url={latest_iso_url}', file=fh)

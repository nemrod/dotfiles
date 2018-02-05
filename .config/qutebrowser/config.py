config.load_autoconfig()

c.tabs.background = True

config.bind(';D', 'hint links spawn transmission-remote -a {hint-url}')
config.bind(';P', 'hint links spawn mpv {hint-url}')
config.bind(',p', 'spawn mpv {url}')

c.url.searchengines['anime'] = 'https://myanimelist.net/search/all?q={}'
c.url.searchengines['ja'] = 'http://tangorin.com/general/{}'
c.url.searchengines['manga'] = 'http://www.mangahere.cc/search.php?name={}'
c.url.searchengines['w'] = 'https://en.wikipedia.org/w/index.php?search={}'

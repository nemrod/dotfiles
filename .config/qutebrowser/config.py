config.load_autoconfig()

c.tabs.background = True
c.content.autoplay = False
c.content.pdfjs = True
c.downloads.location.directory = '~'
c.editor.command = ['termite', '-e', 'vim {}']
c.hints.chars = 'aoeuidhtns'

config.bind(';D', 'hint links spawn transmission-remote -a {hint-url}')
config.bind(';P', 'hint links spawn mpv {hint-url}')
config.bind(',p', 'spawn mpv {url}')

c.url.searchengines['anime'] = 'https://myanimelist.net/anime.php?q={}'
c.url.searchengines['ja'] = 'https://tangorin.com/words?search={}'
c.url.searchengines['manga'] = 'https://mangadex.org/search?title={}'
c.url.searchengines['w'] = 'https://en.wikipedia.org/w/index.php?search={}'
c.url.searchengines['yt'] = 'https://www.youtube.com/results?search_query={}'
c.url.searchengines['maps'] = 'https://www.google.com/maps/?q={}'

config.load_autoconfig()

c.content.autoplay = False
c.content.pdfjs = True
c.downloads.location.directory = '~'
c.editor.command = ['termite', '-e', 'vim {}']
c.hints.chars = 'aoeuidhtns'

config.bind(';D', 'hint links spawn transmission-remote -a {hint-url}')
config.bind(';p', 'hint links spawn mpv {hint-url}')
config.bind(';cn', 'hint links spawn catt cast {hint-url}')
config.bind(';cq', 'hint links spawn catt add {hint-url}')
config.bind(',p', 'spawn mpv {url}')
config.bind(',cn', 'spawn catt cast {url}')
config.bind(',cq', 'spawn catt add {url}')

c.url.searchengines['anime'] = 'https://myanimelist.net/anime.php?q={}'
c.url.searchengines['ja'] = 'https://jisho.org/search/{}'
c.url.searchengines['manga'] = 'https://mangadex.org/titles?page=1&q={}&translatedLang=en,sv&order=relevance.desc'
c.url.searchengines['w'] = 'https://en.wikipedia.org/w/index.php?search={}'
c.url.searchengines['sw'] = 'https://sv.wikipedia.org/w/index.php?search={}'
c.url.searchengines['yt'] = 'https://www.youtube.com/results?search_query={}'
c.url.searchengines['maps'] = 'https://www.google.com/maps/?q={}'
c.url.searchengines['tradera'] = 'https://www.tradera.com/search?q={}&queryScope=AnyWordsAnyOrder&searchInLongDescription=true&sortBy=AddedOn'
c.url.searchengines['tr'] = 'https://translate.google.com/?sl=auto&tl=en&text={}&op=translate'

for mode in ["normal", "caret"]:
    config.bind(',t', 'spawn --userscript yomichad', mode=mode)
    config.bind(',T', 'spawn --userscript yomichad --prefix-search', mode=mode)

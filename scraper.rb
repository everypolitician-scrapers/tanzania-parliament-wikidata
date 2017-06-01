#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names_10 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_MPs_elected_in_the_Tanzania_general_election,_2010',
  xpath: '//table[.//th[text()="Constituency"]]//tr[td]//td[5]//a[not(@class="new")]/@title',
)

names_15 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_current_members_of_the_Tanzanian_Parliament',
  xpath: '//table[.//th[text()="Constituency"]]//tr[td]//td[2]//a[not(@class="new")]/@title',
)

query = 'SELECT DISTINCT ?item WHERE { ?item wdt:P39 wd:Q17599130 .  }'
p39s = EveryPolitician::Wikidata.sparql(query)

EveryPolitician::Wikidata.scrape_wikidata(ids: p39s, names: { en: names_10 | names_15 })

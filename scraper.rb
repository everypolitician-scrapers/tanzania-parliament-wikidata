#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_MPs_elected_in_the_Tanzania_general_election,_2010',
  xpath: '//table[.//th[text()="Constituency"]]//tr[td]//td[5]//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })

require 'sinatra/base'
require 'json'
require 'digest/md5'
require 'date'

class App < Sinatra::Base
	get '/' do
		content_type :json

		@south_park = [
			{name: 'Erick Cartman', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/eric-cartman.png?height=98'},
			{name: 'Kenny McCormick', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/kenny-mccormick.png?height=98'},
			{name: 'Kyle Broflovski', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/kyle-broflovski.png?height=98'},
			{name: 'Stan Marsh', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/stan-marsh.png?height=98'},
			{name: 'Butters Stotch', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/butters-stotch.png?height=98'},
			{name: 'Jimmmy Valmer', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/jimmy-valmer.png?height=98'},
			{name: 'Timmy Burch', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/timmy-burch.png?height=98'},
			{name: 'Tweek Tweak', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/tweek-tweak.png?height=98'},
			{name: 'Wendy Testaburger', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/wendy-testaburger.png?height=98'},
			{name: 'Pip Pirrup', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/pip-pirrup.png?height=98'},
			{name: 'Scott Malkinson', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/scott-malkinson.png?height=98'},
			{name: 'Token Black', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/token-black.png?height=98'},
			{name: 'Bebe Stevens', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/bebe-stevens.png?height=98'},
			{name: 'Clyde Donovan', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/clyde-donovan.png?height=98'},
			{name: 'Red', photo_url: 'http://southparkstudios.mtvnimages.com/shared/characters/kids/red.png?height=98'}
		]

		# cache_control :public, :must_revalidate, :max_age => 300

		# last_modified Date.today

		etag Digest::MD5.hexdigest(@south_park.to_s)

		return @south_park.to_json
	end
end
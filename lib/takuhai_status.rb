require "takuhai_status/version"
require "takuhai_status/japanpost"
require "takuhai_status/kuronekoyamato"
require "takuhai_status/sagawa"
require "takuhai_status/tmg_cargo"

module TakuhaiStatus
	class NotFound < StandardError; end
	class NotMyKey < StandardError; end

	def self.scan(key)
		[JapanPost, KuronekoYamato, Sagawa, TMGCargo].each do |service|
			begin
				return service.new(key)
			rescue NotMyKey
			end
		end
		raise NotFound
	end
end

module FriendshipsHelper

	def cache_key_for_friendship_table
		"friendship-table-#{Friendship.maximum(:updated_at)}"
	end

	def cache_key_for_friendship_row(friendship)
		"friendship-#{friendship.id}-#{friendship.updated_at}"
	end

end
